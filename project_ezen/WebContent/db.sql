-- 굿초이스 db 만들기

-- 1. 이승운

-- 회원 가입 정보
drop table gym_member;
create table gym_member(
    member_idx      number(4) primary key,
    member_id       varchar2(20),
    member_pw       varchar2(20),
    member_name     varchar2(20),
    member_birth_date      varchar2(20), 
    member_gender          varchar2(10),
    member_phone           varchar2(20),
    member_email           varchar2(100),
    member_email_receive   number(10), -- 0:비수신 1:수신
    member_coupon01        number(10) default 0,
    member_coupon02        number(10) default 0,
    member_locker          number(10) default 0,
    member_pay_sum         number(20) default 0,
    member_agree           varchar2(10), -- N:비동의 Y:동의
    member_join_date       date default sysdate
);

drop sequence gym_member_seq;
create sequence gym_member_seq;

-- 탈퇴 회원 등록 정보
drop table gym_out_member;
create table gym_out_member(
    out_member_idx        number(4) primary key,
    out_member_id         varchar2(20),
    out_member_name       varchar2(20),
    out_member_pay_sum    varchar2(20),
    out_member_join_date  varchar2(30), 
    out_member_reason     varchar2(100),
    out_member_opinion    varchar2(1000),
    out_member_date       date default sysdate
);

drop sequence gym_out_member_seq;
create sequence gym_out_member_seq;

--insert into board(board_idx, board_name, board_title, board_content, board_date) 
--values (board_seq.nextval, '홍길동', '글 제목1', '글 내용1', sysdate);

-- 탈퇴 회원

-- 2. 이수지

-- 회원권 구매 정보
drop table gym_pay;
create table gym_pay(
  pay_idx             number(4) primary key, 
  pay_name            varchar2(30),
  pay_membership      varchar2(40),
  pay_coupon_num      number(4),
  pay_amount          number(20),
  pay_start_date      varchar2(30),
  pay_end_date        varchar2(30),
  pay_payment_date    date default sysdate,
  pay_member_idx      number(4) references gym_member(member_idx) on delete cascade
);

drop sequence gym_pay_seq;
create sequence gym_pay_seq;   

-- 1:1문의 게시글 정보
drop table gym_inquiry;
create table gym_inquiry(
  inq_idx             number(4) primary key,     
  inq_type            varchar2(20),
  inq_title           varchar2(100),
  inq_name            varchar2(20),
  inq_content         varchar2(700), 
  inq_state           varchar2(10),
  inq_re_content      varchar2(500), 
  inq_date            date default sysdate,
  inq_member_idx      number(4) references gym_member(member_idx) on delete cascade
);

drop sequence gym_inquiry_seq;
create sequence gym_inquiry_seq; 

-- FAQ 게시글 정보
drop table gym_faq;
create table gym_faq(
  faq_idx             number(4) primary key,     
  faq_title           varchar2(100),
  faq_content         varchar2(1000),
  faq_date            date default sysdate
);

drop sequence gym_faq_seq;
create sequence gym_faq_seq; 

insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, '헬스장 운영시간 및 휴일은 언제인가요?', 
'굿초이스 헬스장은 평일 24시간, 연중무휴 오픈을 원칙으로 운영하고 있습니다. 
 단, 지점 재정비 등 부득이 하게 휴관을 해야하는 경우 회원님들께
 사전 공지해드립니다.', sysdate)
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, '회원권 이용 요금이 궁금합니다.', 
'굿초이스 헬스장은 회원권 종류에 따라 이용 요금이 다르게 책정됩니다.
 ※ 일반회원권 1개월-5만원, 3개월-13만원, 6개월-22만원, 12개월-37만원.
 스페셜회원권(3개월) 그룹PT-40만원, 필라테스-45만원, 골프-56만원 입니다. ※', sysdate)
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, ' 퍼스널 트레이닝(P.T) 가격과 신청방법이 궁금합니다.', 
'굿초이스 헬스장은 트레이너의 경력,역량에 따라 트레이너 레벨을 구분하고 있으며,
 레벨 별 퍼스널 트레이닝 금액이 상이합니다. 수업은 50분 기준으로 진행되며,
 등록하는 세션에 따라 할인율이 달라질 수 있습니다. 따라서 신청을 위해 지점으로
 직접 방문하여 맞춤 상담을 받아보시기를 추천드립니다.', sysdate)
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, '운동복과 개인사물함을 꼭 신청해야 하나요?', 
'운동복과 개인 사물함 필수가 아닌 선택 서비스입니다. 저희 굿초이스 헬스장에서는 
 회원님들께 편의를 드리고자 모두 무료로 대여해드리고 있습니다.
 회원권 시작후 첫 방문시 데스크에 오시면 개인사물함 번호와 함께 열쇠를 지급해드리며,
 회원권이 끝나고 반드시 열쇠를 반납해주셔야 됩니다. 
 ※ 열쇠 분실시 3만원을 지불해야 하므로 주의해주세요! ※', sysdate)
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, '개인적으로 준비해야 할 부분이 있을까요?', 
'샤워 용품센터에서는 수건과 비누를 제공하고 있습니다.평소 사용하시는 샤워 용품이 
 있으시면 개인 지참 부탁드립니다. 또한 실외에서 신은 운동화는 센터 내에서 
 착용하실 수 없기 때문에, 실내 전용 운동화를 반드시 준비해주시기 바랍니다.
 마지막으로 대여용 운동복을 원하지 않는 경우에는 개인 운동복도 함께 준비해주세요.', sysdate) 
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, '운동을 처음 해보는데, 어떻게 운동해야 하는지 모르겠어요.', 
'걱정하지 않으셔도 됩니다! 굿초이스 헬스장에서는 신규 회원 등록 시, 
 전문적인 트레이너의 1:1 운동 지도 2회를 제공해 드리고 있습니다. 뿐만 아니라, 
 센터 내에 상주하는 트레이너가 친절하게 도와드리고 있으니 부담 갖지 마시고
 언제라도 편하게 트레이너 및 데스크에 문의해 주세요.', sysdate) 
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, 'G.X이용 방법이 궁금합니다.', 
'G.X 프로그램은 회원권 이용시 무료로 자유롭게 이용하실 수 있습니다.
 다만, 예약제로 운영되기 때문에 전화또는 현장에서 예약후 이용가능합니다.
 G.X 프로그램 시간표는 [헬스장소개<Schedule] 또는 홈페이지의 메인화면에서
 확인가능합니다.', sysdate) 
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, '연기는 가능한가요?', 
'연기 신청은 3개월 등록 기간을 기준으로 1회, 1회 당 최대 1개월(30일)까지 가능합니다.
 연기 기간 만료 시 이용 기간은 자동으로 진행되며 별도로 안내드리지 않습니다.
 저희 헬스장으로 전화 주시거나 직접 방문하여 연기 신청을 할 수 있습니다.', sysdate)
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, '개인사물함 사용기간 만료 시에는 물품을 언제까지 보관하나요?', 
'굿초이스 헬스장에서는 소비자기본법과 공정거래위원회의 권장 규정에 따라
 이용 기간 종료 후 14일 경과 후에도 이용자가 소지품 미회수 시
 보관 중인 소지품을 회수하여 따로 보관하며, 그때로부터
 다시 14일 경과 후에도 이용자가 소지품을 미회수 시 보관품을 폐기 등 
 적정한 방법으로 처분합니다.', sysdate)
insert into gym_faq(faq_idx, faq_title, faq_content, faq_date) 
values (gym_faq_seq.nextval, '환불은 어떻게 진행되나요?', 
'환불에 관한 문의는 굿초이스 헬스장으로 전화주시거나 직접 방문해 주세요.', sysdate)

-- 3. 이세영

-- 트레이너 정보

-- 시간표 정보

-- 시간표 정보1
drop table gym_schedule;

create table gym_schedule(

    gym_schedule_idx       number(4) primary key,
    gym_schedule_content   number(4),
    gym_mon101 varchar2(30),
    gym_mon102 varchar2(30),
    gym_mon103 varchar2(30),
    gym_mon104 varchar2(30),
    gym_tue101 varchar2(30),
    gym_tue102 varchar2(30),
    gym_tue103 varchar2(30),
    gym_tue104 varchar2(30),
    gym_wed101 varchar2(30),
    gym_wed102 varchar2(30),
    gym_wed103 varchar2(30),
    gym_wed104 varchar2(30),
    gym_thu101 varchar2(30),
    gym_thu102 varchar2(30),
    gym_thu103 varchar2(30),
    gym_thu104 varchar2(30),
    gym_fri101 varchar2(30),
    gym_fri102 varchar2(30),
    gym_fri103 varchar2(30),                   
    gym_fri104 varchar2(30),
    gym_sat101 varchar2(30),                     
    gym_sat102 varchar2(30),
    gym_sat103 varchar2(30),
    gym_sat104 varchar2(30),
    gym_sun101 varchar2(30),
    gym_sun102 varchar2(30),
    gym_sun103 varchar2(30),
    gym_sun104 varchar2(30)
);

insert into gym_schedule(gym_schedule_idx, gym_schedule_content,gym_mon101,gym_mon102,gym_mon103,gym_mon104,gym_tue101,gym_tue102,gym_tue103,gym_tue104, gym_wed101, gym_wed102, gym_wed103, gym_wed104,gym_thu101,gym_thu102,gym_thu103,gym_thu104, gym_fri101, gym_fri102, gym_fri103, gym_fri104, gym_sat101, gym_sat102, gym_sat103, gym_sat104,gym_sun101,gym_sun102,gym_sun103,gym_sun104
) 
values (1, '10','줌바댄스','요가',' 필라테스','스피닝','에어로빅','필라테스','요가','바디스컬트','줌바댄스','요가','필라테스','스피닝','에어로빅','필라테스','요가','바디스컬트','줌바댄스','요가','필라테스','스피닝','에어로빅','필라테스','요가','바디스컬트','줌바댄스','요가','필라테스','스피닝'
);

--시간표 정보2
drop table gym_schedule2;

create table gym_schedule2(

    gym_schedule2_idx       number(4) primary key,
    gym_schedule2_content   number(4),
    gym_mon201 varchar2(30),
    gym_mon202 varchar2(30),
    gym_mon203 varchar2(30),
    gym_mon204 varchar2(30),
    gym_tue201 varchar2(30),
    gym_tue202 varchar2(30),
    gym_tue203 varchar2(30),
    gym_tue204 varchar2(30),
    gym_wed201 varchar2(30),
    gym_wed202 varchar2(30),
    gym_wed203 varchar2(30),
    gym_wed204 varchar2(30),
    gym_thu201 varchar2(30),
    gym_thu202 varchar2(30),
    gym_thu203 varchar2(30),
    gym_thu204 varchar2(30),
    gym_fri201 varchar2(30),
    gym_fri202 varchar2(30),
    gym_fri203 varchar2(30),                   
    gym_fri204 varchar2(30),
    gym_sat201 varchar2(30),                     
    gym_sat202 varchar2(30),
    gym_sat203 varchar2(30),
    gym_sat204 varchar2(30),
    gym_sun201 varchar2(30),
    gym_sun202 varchar2(30),
    gym_sun203 varchar2(30),
    gym_sun204 varchar2(30)                           
);

insert into gym_schedule2(gym_schedule2_idx, gym_schedule2_content, gym_mon201,gym_mon202,gym_mon203,gym_mon204,gym_tue201,gym_tue202,gym_tue203,gym_tue204, gym_wed201, gym_wed202, gym_wed203, gym_wed204,gym_thu201,gym_thu202,gym_thu203,gym_thu204, gym_fri201, gym_fri202, gym_fri203, gym_fri204, gym_sat201, gym_sat202, gym_sat203, gym_sat204,gym_sun201,gym_sun202,gym_sun203,gym_sun204) 
values (1,20, '그룹PT','골프',' 필라테스','그룹PT','그룹PT','골프',' 필라테스','그룹PT','그룹PT','골프',' 필라테스','그룹PT','그룹PT','골프',' 필라테스','그룹PT','그룹PT','골프',' 필라테스','그룹PT','그룹PT','골프',' 필라테스','그룹PT','그룹PT','골프',' 필라테스','그룹PT');



-- 4. 김주원

-- 공지사항

-- 


--설명 예제
drop table gym_test;
create table gym_test(
    
    member_id       varchar2(20),
    member_pw       varchar2(20),
    member_name     varchar2(20)
);

drop sequence gym_test_seq;
create sequence gym_test_seq;

insert into gym_test(member_id, member_pw, member_name) 
values ( '홍길동', '글 제목1', '글 내용1');

select * from gym_test;
select * from gym_test where member_idx=1;

UPDATE gym_test SET member_id='박길동', member_pw='ㅇㅇㅇ', member_name='111';

drop table gym_test2;
create table gym_test2(
    
    test_idx       varchar2(20),
    test_pw       varchar2(20),
    test_value1     number(20),
    test_member_idx    number(4) references gym_member(member_idx) on delete cascade
);

insert into gym_test2(test_idx, test_pw, test_value1,test_member_idx) 
values ( '홍길동', '글 제목1', 10000,1);
insert into gym_test2(test_idx, test_pw, test_value1,test_member_idx) 
values ( '백길동', '글 제목2', 10000,2);
insert into gym_test2(test_idx, test_pw, test_value1,test_member_idx) 
values ( '홍길동', '글 제목1', 10000,1);
insert into gym_test2(test_idx, test_pw, test_value1,test_member_idx) 
values ( '홍길동', '글 제목1', 10000,1);

select sum(test_value1) from gym_test2 where test_member_idx = 1;