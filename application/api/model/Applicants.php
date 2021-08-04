<?php
namespace app\api\model;

class Applicants extends BaseModel {
    public function InterviewArrangement () {
        return $this->hasMany('InterviewArrangement', 'applicants_id', 'id');
    }
}