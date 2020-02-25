<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="index.lo">
                    <h1 class="tm-site-title mb-0"> Medication </h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link active" href="index.lo">
                                <i class="fas fa-tachometer-alt"></i>
                                   	메인
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="diagnosis.dr">
                                <i class="fa fa-medkit"></i>
                              	  	진단 
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="schedule.dr">
                                <i class="fa fa-calendar"></i>
                                   	 병원 일정표 
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="patientinfo.dr">
                                <i class="fa fa-search" aria-hidden="true"></i>
                                   	 환자조회
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="board.lo">
                                <i class="fas fa-list"></i>
                                	 게시판
                            </a>
                        </li>
                        
                    </ul>
                    <ul class="navbar-nav">
                       <li class="nav-item">
                          <a class="nav-link">
                            <i class="fa fa-user-circle"></i>
                                ${sessionScope.mem_id}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-block" href="logout.lo">
                            <i class="fa fa-sign-out"></i>
                                Logout
                                <!-- <b>Logout</b> -->
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>