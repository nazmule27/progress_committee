<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Committee_model extends CI_Model
{
    function __construct() {
        parent::__construct();
        $this->load->database();
    }
    public function getDoctors()
    {
        $arr=array();
        $this->db->select('fac_login, CONCAT(fac_name," (", fac_login,")") as fac_name');
        $this->db->from('cseweb.fac_list');
        $this->db->like('fac_name', 'Dr.');
        $this->db->order_by('fac_name');
        $query = $this->db->get();
        foreach($query->result_array() as $row){
            $arr[$row['fac_login']]=$row['fac_name'];
        }
        return $arr;
    }
    public function getStudents()
    {
        $arr=array();
        $this->db->select('STUDENTID, CONCAT(STUDENTNAME," (", STUDENTID,")") as STUDENTNAME');
        $this->db->from('cseweb.csestudents');
        $this->db->where('LENGTH(STUDENTID)>7', null, false);
        $this->db->order_by('STUDENTNAME');
        $query = $this->db->get();
        foreach($query->result_array() as $row){
            $arr[$row['STUDENTID']]=$row['STUDENTNAME'];
        }
        return $arr;
    }
    public function getDoctorList()
    {
        $this->db->select('fac_login, CONCAT(fac_name," (", fac_login,")") as fac_name');
        $this->db->from('cseweb.fac_list');
        $this->db->like('fac_name', 'Dr.');
        $this->db->order_by('fac_name');
        $query = $this->db->get();
        return $result = $query->result();
    }
    public function validateStudent($data) {
        $this->db->where('for_student', $data);
        return $this->db->get('committee')->row();
    }
    public function saveCommittee($data)
    {
        $this->db->insert('committee', $data);
        $query = $this->db->query('SELECT LAST_INSERT_ID()');
        $row = $query->row_array();
        return $row['LAST_INSERT_ID()'];
    }
    public function saveCommitteeMember($data)
    {
        $this->db->insert_batch('committee_member', $data);
    }

    public function getCommittee()
    {
        $this->db->select('id, student_name(for_student) as for_student,faculty_name(supervisor) as supervisor,faculty_name(co_supervisor) as co_supervisor');
        $this->db->from('committee');
        $this->db->order_by('id desc');
        $query = $this->db->get();
        return $result = $query->result();
    }
    public function getSingleCommittee($id)
    {
        $this->db->select('id, student_name(for_student) as for_student,faculty_name(supervisor) as supervisor,faculty_name(co_supervisor) as co_supervisor, created_at ');
        $this->db->from('committee');
        $this->db->where('id',$id);
        $this->db->order_by('id desc');
        $query = $this->db->get();
        return $result = $query->result();
    }
    public function getSingleCommitteeMembers($id)
    {
        $this->db->select('faculty_name(member) as member');
        $this->db->from('committee_member');
        $this->db->where('cid',$id);
        $this->db->order_by('member');
        $query = $this->db->get();
        return $result = $query->result();
    }

    function __destruct() {
        $this->db->close();
    }
}