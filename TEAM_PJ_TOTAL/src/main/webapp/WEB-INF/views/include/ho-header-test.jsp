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
                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-file-alt"></i>
                                <span>
                                   	회원관리 <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="signcheck.ho">의료인 가입 승인</a>
                                <a class="dropdown-item" href="select.ho">환자 조회</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-user"></i>
                                <span>
                                   	보건정보 <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="druginfo.ho">약품정보</a>
                                <!-- <a class="dropdown-item" href="selfcheck2.pa">스트레스 자가진단</a> -->
                                <a class="dropdown-item" href="dietinfo.ho">식단정보</a>
                            </div>
                        </li>                        
                        <li class="nav-item">
                            <a class="nav-link" href="total.ho">
                                <i class="fas fa-shopping-cart"></i>
                                	결산
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="chatbot.ho">
                                <i class="fas fa-shopping-cart"></i>
                                	챗봇관리
                            </a>
                        </li>
                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-user"></i>
                                <span>
                                   	통계 <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="statistics.ho">질병 통계</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="board.lo">
                                <i class="fas fa-shopping-cart"></i>
                                	게시판
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="logout.lo">
                                <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>