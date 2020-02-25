<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
    <li class="active"><a href="index.lo"><i class="icon icon-home"></i> <span>메인</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span> 진료 </span> <span class="label label-important">1</span></a>
      <ul>
      <!-- 진단은 드롭다운이 아니어도 될 것 같지만 우선 이렇게 해놓을게용~! -->
        <li><a href="diagnosis.dr"> 진단 </a></li>
      </ul>
    </li>
    <li> <a href="schedule.dr"><i class="icon icon-signal"></i> <span> 병원 스케줄 조회</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span> 환자관리 </span> <span class="label label-important">1</span></a>
      <ul>
        <li><a href="patientinfo.dr"> 환자조회 </a></li>
        <li><a href="searchTest.lo"> ajaxTest </a></li>
        <li><a href="test.ho"> security </a></li>
      </ul>
    </li>
  </ul>
</div>