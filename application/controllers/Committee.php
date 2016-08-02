<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Committee extends CI_Controller {
	function __construct() {
		parent::__construct();
		$this->load->model("Committee_model");
		$this->load->model("Supervisor_model");
		if((($this->session->userdata('role'))!=='Admin')) {
			$this->session->set_flashdata('flash_data', 'You don\'t have access!');
			redirect('login');
		}
	}
	public function index()
	{
		$data['doctors'] = $this->Committee_model->getDoctors();
		$data['students'] = $this->Committee_model->getStudents();
		$data['doctorList'] = $this->Committee_model->getDoctorList();
		$this->load->view('admin/committee_create', $data);
	}
	Public function save(){
		$status = $this->Committee_model->validateStudent($this->input->post('for_student'));
		if(empty($status)) {
			$CI = &get_instance();
			$username = $CI->session->userdata('username');
			$data = array(
				'for_student' => $this->input->post('for_student'),
				'supervisor' => $this->input->post('supervisor'),
				'co_supervisor' => $this->input->post('co_supervisor'),
				'ex_officio' => $this->input->post('ex_officio'),
				//'members' => $members,
				'created_by' => $username,
			);
			$cid=$this->Committee_model->saveCommittee($data);

			$member_data =array();
			for($i=0; $i <41; $i++) {
				$member = $this->input->post('member'.$i);
				if (isset($member)) {
					$member_data[$i] = array(
						'cid' => $cid,
						'member' => $member,
					);
				}
			}
			$this->Committee_model->saveCommitteeMember($member_data);

			$data['success_msg'] = '<div class="alert alert-success text-center">Committee created successfully !<strong><a class="close" title="close" aria-label="close" data-dismiss="alert" href="#"> &times;</a> </strong></div>';
			$data['doctors'] = $this->Committee_model->getDoctors();
			$data['students'] = $this->Committee_model->getStudents();
			$data['doctorList'] = $this->Committee_model->getDoctorList();
			$this->load->view('admin/committee_create', $data);
		}
		else {
			$data['success_msg'] = '<div class="alert alert-warning text-center">For this student already committee created !<strong><a class="close" title="close" aria-label="close" data-dismiss="alert" href="#"> &times;</a> </strong></div>';
			$data['doctors'] = $this->Committee_model->getDoctors();
			$data['students'] = $this->Committee_model->getStudents();
			$data['doctorList'] = $this->Committee_model->getDoctorList();
			$this->load->view('admin/committee_create', $data);
		}
	}

	public function committee_list()
	{
		$data['all_committee'] = $this->Committee_model->getCommittee();
		$this->load->view('admin/committee_list', $data);
	}
	public function committee_detail($id)
	{
		$data['committee'] = $this->Committee_model->getSingleCommittee($id);
		$data['committees'] = $this->Committee_model->getSingleCommitteeMembers($id);
		$data['meetings'] = $this->Supervisor_model->getMeetings($id);
		$this->load->view('admin/committee_detail',$data);
	}
	public function committee_print($id)
	{
		$data['committee'] = $this->Committee_model->getSingleCommittee($id);
		$data['committees'] = $this->Committee_model->getSingleCommitteeMembers($id);
		$this->load->view('admin/committee_print',$data);
	}

}
