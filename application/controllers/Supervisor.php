<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Supervisor extends CI_Controller {
	function __construct() {
		parent::__construct();
		$this->load->model("Supervisor_model");
		if((($this->session->userdata('role'))!=='Supervisor')&&(($this->session->userdata('role'))!=='Admin')) {
			$this->session->set_flashdata('flash_data', 'You don\'t have access!');
			redirect('login');
		}
	}
	public function index()
	{

		$CI = &get_instance();
		$username = $CI->session->userdata('username');
		$data['all_committee'] = $this->Supervisor_model->getUpcomingMeetings($username);
		$data['co_supervisor_committee'] = $this->Supervisor_model->getUpcomingCoSupervisorMeetings($username);
		$data['member_committee'] = $this->Supervisor_model->getUpcomingMemberMeetings($username);
		$this->load->view('supervisor/home', $data);
	}
	public function home()
	{
		$CI = &get_instance();
		$username = $CI->session->userdata('username');
		$data['all_committee'] = $this->Supervisor_model->getCommittee($username);
		$data['co_supervisor_committee'] = $this->Supervisor_model->getCoSupervisorCommittee($username);
		$data['member_committee'] = $this->Supervisor_model->getMemberCommittee($username);
		$this->load->view('supervisor/committee_list', $data);
	}
	public function committee_detail($id)
	{
		$data['committee'] = $this->Supervisor_model->getSingleCommittee($id);
		$data['committees'] = $this->Supervisor_model->getSingleCommitteeMembers($id);
		$data['meetings'] = $this->Supervisor_model->getMeetings($id);
		$this->load->view('supervisor/committee_detail',$data);
	}
	public function meeting_call($id)
	{
		$data['committee'] = $this->Supervisor_model->getSingleCommittee($id);
		$data['meeting_type'] = $this->Supervisor_model->getMeetingType();
		$data['external'] = $this->Supervisor_model->getExternal();
		$this->load->view('supervisor/meeting_call',$data);
	}
	public function meeting_call_save() {
		$CI = &get_instance();
		$username = $CI->session->userdata('username');
		$config['upload_path'] = 'assets/docs/';
		$config['allowed_types'] = 'doc|docx|pdf|jpg';
		$config['file_name'] = $this->input->get('cid').$username;
		$this->load->library('upload', $config);
		$meeting_doc = $_FILES["meeting_doc"]["name"];
		if($meeting_doc){
			if (!$this->upload->do_upload('meeting_doc'))
			{
				$data = array('error' => $this->upload->display_errors(), 'meeting_type'=>$this->Supervisor_model->getMeetingType(), 'committee'=>$this->Supervisor_model->getSingleCommittee($this->input->get('cid')), 'external'=>$this->Supervisor_model->getExternal());
				$this->load->view('supervisor/meeting_call', $data);
			}
			else
			{
				$upload_data = $this->upload->data();
				$data = array(
					'cid' => $this->input->get('cid'),
					'type' => $this->input->post('meeting_type'),
					'external' => $this->input->post('external'),
					'title' => $this->input->post('title'),
					'meeting_date_time' => $this->input->post('meeting_date_time'),
					'called_by' => $username,
				);
				$mid=$this->Supervisor_model->saveMeetingCall($data);
				$meeting_data = array(
					'mid' => $mid,
					'file_name' => $upload_data['file_name'],
					'document_type' => 'pre_meeting_document',
					'meeting_type' => $this->input->post('meeting_type'),
					'uploaded_by' => $username,
				);
				$this->Supervisor_model->saveMeetingDocuments($meeting_data);
				$data['committee'] = $this->Supervisor_model->getSingleCommittee($this->input->get('cid'));
				$data['meeting_type'] = $this->Supervisor_model->getMeetingType();
				$data['external'] = $this->Supervisor_model->getExternal();
				$data['success_msg'] = '<div class="alert alert-success text-center">Your meeting call saved with documents successfully! <strong><a class="close" title="close" aria-label="close" data-dismiss="alert" href="#">  &times;</a> </strong></div>';
				$this->load->view('supervisor/meeting_call', $data);
			}
		}
		else {
			$data = array(
				'cid' => $this->input->get('cid'),
				'title' => $this->input->post('title'),
				'type' => $this->input->post('meeting_type'),
				'external' => $this->input->post('external'),
				'meeting_date_time' => $this->input->post('meeting_date_time'),
				'called_by' => $username,
			);
			$this->Supervisor_model->saveMeetingCall($data);
			$data['committee'] = $this->Supervisor_model->getSingleCommittee($this->input->get('cid'));
			$data['meeting_type'] = $this->Supervisor_model->getMeetingType();
			$data['external'] = $this->Supervisor_model->getExternal();
			$data['success_msg'] = '<div class="alert alert-success text-center">Your meeting call saved without documents successfully! <strong><a class="close" title="close" aria-label="close" data-dismiss="alert" href="#">  &times;</a> </strong></div>';
			$this->load->view('supervisor/meeting_call', $data);
		}
	}
	public function document_upload($mid)
	{
		$data['committee'] = $this->Supervisor_model->getSingleMeetingCommittee($mid);
		$data['meeting'] = $this->Supervisor_model->getMeetingDetail($mid);
		$this->load->view('supervisor/document_upload',$data);
	}
	public function document_upload_save() {
		$CI = &get_instance();
		$username = $CI->session->userdata('username');
		$config['upload_path'] = 'assets/docs/';
		$config['allowed_types'] = 'doc|docx|pdf|jpg';
		$config['file_name'] = $this->input->get('cid').$username;
		$this->load->library('upload', $config);
		$meeting_doc = $_FILES["meeting_doc"]["name"];
		if($meeting_doc){
			if (!$this->upload->do_upload('meeting_doc'))
			{
				$upload_error = array('error' => $this->upload->display_errors(), 'committee'=>$this->Supervisor_model->getSingleMeetingCommittee($this->input->get('mid')), 'meeting'=>$this->Supervisor_model->getMeetingDetail($this->input->get('mid')));
				$this->load->view('supervisor/document_upload', $upload_error);
			}
			else
			{
				$upload_data = $this->upload->data();
				$data = array(
					'mid' => $this->input->get('mid'),
					'comment' => $this->input->post('comment'),
					'file_name' => $upload_data['file_name'],
					'document_type' => $this->input->post('document_type'),
					'meeting_type' => $this->input->post('meeting_type'),
					'student_can_see' => $this->input->post('student_can_see'),
					'uploaded_by' => $username,
				);
				$this->Supervisor_model->saveMeetingDocuments($data);
				$data['committee'] = $this->Supervisor_model->getSingleMeetingCommittee($this->input->get('mid'));
				$data['meeting'] = $this->Supervisor_model->getMeetingDetail($this->input->get('mid'));
				$data['success_msg'] = '<div class="alert alert-success text-center">Your meeting documents saved successfully! <strong><a class="close" title="close" aria-label="close" data-dismiss="alert" href="#">  &times;</a> </strong></div>';
				$this->load->view('supervisor/document_upload',$data);
			}
		}
		else {
			$data = array(
				'mid' => $this->input->get('mid'),
				'comment' => $this->input->post('comment'),
				'document_type' => $this->input->post('document_type'),
				'meeting_type' => $this->input->post('meeting_type'),
				'student_can_see' => $this->input->post('student_can_see'),
				'uploaded_by' => $username,
			);
			$this->Supervisor_model->saveMeetingDocuments($data);
			$data['committee'] = $this->Supervisor_model->getSingleMeetingCommittee($this->input->get('mid'));
			$data['meeting'] = $this->Supervisor_model->getMeetingDetail($this->input->get('mid'));
			$data['success_msg'] = '<div class="alert alert-success text-center">Your meeting comment saved successfully! <strong><a class="close" title="close" aria-label="close" data-dismiss="alert" href="#">  &times;</a> </strong></div>';
			$this->load->view('supervisor/document_upload',$data);
		}
	}
	public function document_detail($mid)
	{
		$data['committee'] = $this->Supervisor_model->getSingleMeetingCommittee($mid);
		$data['document'] = $this->Supervisor_model->getDocumentList($mid);
		$this->load->view('supervisor/document_detail',$data);
	}

}
