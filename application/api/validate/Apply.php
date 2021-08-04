<?php
namespace app\api\validate;

use LinCmsTp5\validate\BaseValidate;

class Apply extends BaseValidate {
    protected $rule = [
        'name' => 'require|chs',
        'gender' => 'require',
        'native_palace' => 'require',
        'date_of_birth' => 'require',
        'date_of_work_first' => 'require',
        'highest_education' => 'require',
        'graduation_school' => 'require',
        'graduation_major' => 'require',
        'date_graduation' => 'require',
        'phone' => 'require|mobile',
        'email' => 'require|email',
        'application_department' => 'require',
        'application_position' => 'require'
    ];

    protected $message = [
        'name' => '姓名必填且中文',
        'gender' => '性别必填',
        'native_palace' => '籍贯必填',
        'date_of_birth' => '出生年月必填',
        'date_of_work_first' => '首次参加工作时间必填',
        'highest_education' => '最高学历必填',
        'graduation_school' => '毕业院校必填',
        'graduation_major' => '专业必填',
        'date_graduation' => '毕业时间必填',
        'phone.require' => '手机号必填',
        'phone.mobile' => '请正确输入手机号',
        'email.require' => '邮箱必填',
        'email.email' => '请正确输入邮箱',
        'application_department' => '应聘部门必填',
        'application_position' => '应聘岗位必填'
    ];
}