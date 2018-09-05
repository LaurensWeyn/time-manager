<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>
    <%--<%@include file="common/headerIncludes.jsp"%>--%>
    <link rel="stylesheet" type="text/css" href="/static/css/calendar.css">
</head>
<body>
<div class="navbar navbar-fixed-top navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
            </button> <a href="#" class="navbar-brand">mchp</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"> <a href="#"><i class="fa fa-home"></i></a>
                </li>
                <li> <a href="#"><i class="fa fa-calendar"></i></a>
                </li>
                <li> <a href="#"><i class="fa fa-book"></i></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge" id="userPoints">3500</span> <i class="fa fa-certificate"></i></a>

                    <ul class="dropdown-menu">
                        <li> <a href="#" id="purchasePointsMenu"><span class="label label-primary"><i class="fa fa-usd"></i></span> Purchase More Points</a>
                        </li>
                        <li class="divider"></li>
                        <li> <a><span class="label label-success">+</span> 1000 Points Purchase</a>
                        </li>
                        <li> <a><span class="label label-success">+</span> 500 Document Sold</a>
                        </li>
                        <li> <a><span class="label label-danger">-</span> 200 Document Bought</a>
                        </li>
                        <li> <a><span class="label label-danger">-</span> 100 Class Unlocked</a>
                        </li>
                        <li> <a><span class="label label-success">+</span> 50 Achievement</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge">10</span> <i class="fa fa-lightbulb-o"></i></a>

                    <ul class="dropdown-menu">
                        <li> <a><span class="label label-success">New</span> ACCT-200 Document Added </a>
                        </li>
                        <li> <a><span class="label label-success">New</span> ACCT-200 Assignment Updated</a>
                        </li>
                        <li> <a><span class="label label-default">Read</span> Some notification</a>
                        </li>
                        <li> <a><span class="label label-default">Read</span> Some notification</a>
                        </li>
                        <li> <a><span class="label label-default">Read</span> Some notification</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> mitchellias <b class="caret"></b> </a>

                    <ul class="dropdown-menu">
                        <li> <a href="/account/"><i class="fa fa-user"></i> Your Account</a>
                        </li>
                        <li> <a href="/sales/"><i class="fa fa-dollar"></i> Your Sales</a>
                        </li>
                        <li class="divider"></li>
                        <li> <a href="/logout/"><i class="fa fa-share-square-o"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div id="overview" class="col-sm-4 col-md-3 animated bounceInUp">
            <h2>Your Calendars</h2>
            <p>Did you know you can create a calendar and sell it, just like a document?</p>
            <p>Your classmates can follow your calendar, and when they do, you'll make money!</p>
            <button type="button" class="btn btn-primary btn-block">Create a Calendar</button>
            <h2>Calendars You Follow</h2>
        </div>
        <!-- End Column -->
        <div id="calendar" class="col-sm-8 col-md-9 animated animated-sm bounceInUp">
            <h2>Calendar <small>plan it</small><i class="fa fa-plus fa-fw pull-right small btn btn-block"></i></h2>

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="calendar fc fc-ltr">
                        <table class="fc-header" style="width:100%">
                            <tbody>
                            <tr>
                                <td class="fc-header-left">
                                    <div class="btn-group">
                                        <button type="button" class="fc-button-prev fc-corner-left btn btn-default btn-sm"> <i class="fa fa-chevron-left"></i>

                                        </button>
                                        <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-right"></i>

                                        </button>
                                    </div> <span class="fc-button fc-button-prev fc-state-default fc-corner-left" unselectable="on"><span class="fc-text-arrow">‹</span></span> <span class="fc-button fc-button-next fc-state-default fc-corner-right" unselectable="on"><span class="fc-text-arrow">›</span></span> <span class="fc-header-space"></span><span class="fc-button fc-button-today fc-state-default fc-corner-left fc-corner-right fc-state-disabled" unselectable="on">today</span>

                                </td>
                                <td class="fc-header-center"> <span class="fc-header-title">          <h2>January 2014</h2>          </span>

                                </td>
                                <td class="fc-header-right"> <span class="fc-button fc-button-month fc-state-default fc-corner-left fc-state-active" unselectable="on">month</span><span class="fc-button fc-button-agendaWeek fc-state-default" unselectable="on">week</span><span class="fc-button fc-button-agendaDay fc-state-default fc-corner-right" unselectable="on">day</span>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="fc-content" style="position: relative; min-height: 1px;">
                            <div class="fc-view fc-view-month fc-grid" style="position: relative; min-height: 1px;" unselectable="on">
                                <div style="position:absolute;z-index:8;top:0;left:0">
                                    <div class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end ui-draggable" style="position: absolute; z-index: 8; left: 495px; top: 60px;" unselectable="on">
                                        <div class="fc-event-inner"> <span class="fc-event-title" style="position:relative; left:18px; top:10px;font-size:20px;">3</span>

                                        </div>
                                        <div class="ui-resizable-handle ui-resizable-e"></div>
                                    </div>
                                    <div class="fc-event fc-event-hori fc-event-draggable fc-event-start" style="position: absolute; z-index: 8; left: 804px; width: 304px; top: 352px;">
                                        <div class="fc-event-inner"> <span class="fc-event-title" style="position:relative; left:18px; top:10px;font-size:20px;">5</span>

                                        </div>
                                    </div>
                                    <div class="fc-event fc-event-hori fc-event-draggable fc-event-end" style="position: absolute; z-index: 8; left: 20px; top: 470px;">
                                        <div class="fc-event-inner"> <span class="fc-event-title" style="position:relative;left:17px;top:9px;font-size:20px;">2</span>

                                        </div>
                                        <div class="ui-resizable-handle ui-resizable-e"></div>
                                    </div>
                                    <div class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end" style="position: absolute; z-index: 8; left: 306px; top: 265px;">
                                        <div class="fc-event-inner"> <span class="fc-event-title" style="position:relative; top:11px; left:18px; font-size:20px;">2</span>

                                        </div>
                                        <div class="ui-resizable-handle ui-resizable-e"></div>
                                    </div>
                                </div>
                                <table class="fc-border-separate" style="width:100%" cellspacing="0">
                                    <thead>
                                    <tr class="fc-first fc-last">
                                        <th class="fc-day-header fc-sun fc-widget-header fc-first" style="width: 158px;">Sun</th>
                                        <th class="fc-day-header fc-mon fc-widget-header" style="width: 158px;">Mon</th>
                                        <th class="fc-day-header fc-tue fc-widget-header" style="width: 158px;">Tue</th>
                                        <th class="fc-day-header fc-wed fc-widget-header" style="width: 158px;">Wed</th>
                                        <th class="fc-day-header fc-thu fc-widget-header" style="width: 158px;">Thu</th>
                                        <th class="fc-day-header fc-fri fc-widget-header" style="width: 158px;">Fri</th>
                                        <th class="fc-day-header fc-sat fc-widget-header fc-last" style="width: 158px;">Sat</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="fc-week fc-first">
                                        <td class="fc-day fc-sun fc-widget-content fc-other-month fc-first" data-date="2013-12-29">
                                            <div style="min-height: 80px;">
                                                <div class="fc-day-number">29</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-mon fc-widget-content fc-other-month" data-date="2013-12-30">
                                            <div>
                                                <div class="fc-day-number">30</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-tue fc-widget-content fc-other-month" data-date="2013-12-31">
                                            <div>
                                                <div class="fc-day-number">31</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-wed fc-widget-content" data-date="2014-01-01">
                                            <div>
                                                <div class="fc-day-number">1</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-thu fc-widget-content" data-date="2014-01-02">
                                            <div>
                                                <div class="fc-day-number">2</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-fri fc-widget-content" data-date="2014-01-03">
                                            <div>
                                                <div class="fc-day-number">3</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-sat fc-widget-content fc-last" data-date="2014-01-04">
                                            <div>
                                                <div class="fc-day-number">4</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="fc-week">
                                        <td class="fc-day fc-sun fc-widget-content fc-first" data-date="2014-01-05">
                                            <div style="min-height: 80px;">
                                                <div class="fc-day-number">5</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-mon fc-widget-content" data-date="2014-01-06">
                                            <div>
                                                <div class="fc-day-number">6</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-tue fc-widget-content" data-date="2014-01-07">
                                            <div>
                                                <div class="fc-day-number">7</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-wed fc-widget-content" data-date="2014-01-08">
                                            <div>
                                                <div class="fc-day-number">8</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-thu fc-widget-content" data-date="2014-01-09">
                                            <div>
                                                <div class="fc-day-number">9</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-fri fc-widget-content" data-date="2014-01-10">
                                            <div>
                                                <div class="fc-day-number">10</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-sat fc-widget-content fc-last" data-date="2014-01-11">
                                            <div>
                                                <div class="fc-day-number">11</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="fc-week">
                                        <td class="fc-day fc-sun fc-widget-content fc-first" data-date="2014-01-12">
                                            <div style="min-height: 80px;">
                                                <div class="fc-day-number">12</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-mon fc-widget-content" data-date="2014-01-13">
                                            <div>
                                                <div class="fc-day-number">13</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-tue fc-widget-content" data-date="2014-01-14">
                                            <div>
                                                <div class="fc-day-number">14</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-wed fc-widget-content" data-date="2014-01-15">
                                            <div>
                                                <div class="fc-day-number">15</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-thu fc-widget-content" data-date="2014-01-16">
                                            <div>
                                                <div class="fc-day-number">16</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-fri fc-widget-content" data-date="2014-01-17">
                                            <div>
                                                <div class="fc-day-number">17</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-sat fc-widget-content fc-last" data-date="2014-01-18">
                                            <div>
                                                <div class="fc-day-number">18</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="fc-week">
                                        <td class="fc-day fc-sun fc-widget-content fc-first" data-date="2014-01-19">
                                            <div style="min-height: 80px;">
                                                <div class="fc-day-number">19</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-mon fc-widget-content" data-date="2014-01-20">
                                            <div>
                                                <div class="fc-day-number">20</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-tue fc-widget-content" data-date="2014-01-21">
                                            <div>
                                                <div class="fc-day-number">21</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-wed fc-widget-content fc-today fc-state-highlight" data-date="2014-01-22">
                                            <div>
                                                <div class="fc-day-number">22</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative;;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-thu fc-widget-content" data-date="2014-01-23">
                                            <div>
                                                <div class="fc-day-number">23</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-fri fc-widget-content" data-date="2014-01-24">
                                            <div>
                                                <div class="fc-day-number">24</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-sat fc-widget-content fc-last" data-date="2014-01-25">
                                            <div>
                                                <div class="fc-day-number">25</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative;"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="fc-week">
                                        <td class="fc-day fc-sun fc-widget-content fc-first" data-date="2014-01-26">
                                            <div style="min-height: 80px;">
                                                <div class="fc-day-number">26</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-mon fc-widget-content" data-date="2014-01-27">
                                            <div>
                                                <div class="fc-day-number">27</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-tue fc-widget-content" data-date="2014-01-28">
                                            <div>
                                                <div class="fc-day-number">28</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-wed fc-widget-content" data-date="2014-01-29">
                                            <div>
                                                <div class="fc-day-number">29</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-thu fc-widget-content" data-date="2014-01-30">
                                            <div>
                                                <div class="fc-day-number">30</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-fri fc-widget-content" data-date="2014-01-31">
                                            <div>
                                                <div class="fc-day-number">31</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-sat fc-widget-content fc-other-month fc-last" data-date="2014-02-01">
                                            <div>
                                                <div class="fc-day-number">1</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 25px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="fc-week fc-last">
                                        <td class="fc-day fc-sun fc-widget-content fc-other-month fc-first" data-date="2014-02-02">
                                            <div style="min-height: 80px;">
                                                <div class="fc-day-number">2</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-mon fc-widget-content fc-other-month" data-date="2014-02-03">
                                            <div>
                                                <div class="fc-day-number">3</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-tue fc-widget-content fc-other-month" data-date="2014-02-04">
                                            <div>
                                                <div class="fc-day-number">4</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-wed fc-widget-content fc-other-month" data-date="2014-02-05">
                                            <div>
                                                <div class="fc-day-number">5</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-thu fc-widget-content fc-other-month" data-date="2014-02-06">
                                            <div>
                                                <div class="fc-day-number">6</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-fri fc-widget-content fc-other-month" data-date="2014-02-07">
                                            <div>
                                                <div class="fc-day-number">7</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fc-day fc-sat fc-widget-content fc-other-month fc-last" data-date="2014-02-08">
                                            <div>
                                                <div class="fc-day-number">8</div>
                                                <div class="fc-day-content">
                                                    <div style="position: relative; height: 0px;"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="unlockModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel"><i class="fa fa-fw fa-unlock"></i> Unlock Calendar</h4>

            </div>
            <div class="modal-body">
                <p class="h3 text-center text-primary"><i class="fa fa-thumbs-up"></i> Woop!</p>
                <p class="lead text-center">Here's what happens when you unlock your calendar:</p>
                <hr>
                <div class="row">
                    <div class="col-xs-1"> <i class="fa fa-fw fa-thumbs-up text-primary"></i>

                    </div>
                    <div class="col-xs-11">You'll instantly get access to all <strong class="text-primary">67 shared assignments</strong> on your calendar.</div>
                    <div class="col-xs-1"> <i class="fa fa-fw fa-thumbs-up text-primary"></i>

                    </div>
                    <div class="col-xs-11">You'll be <strong>notified</strong> whenever a shared assignment is <strong>updated or edited</strong> throughout the semester.</div>
                    <div class="col-xs-1"> <i class="fa fa-fw fa-thumbs-up text-primary"></i>

                    </div>
                    <div class="col-xs-11">You'll be able to <strong>share your own calendar assignments</strong> with your class, which means you can start making money instantly.</div>
                    <div class="col-xs-1"> <i class="fa fa-fw fa-thumbs-up text-primary"></i>

                    </div>
                    <div class="col-xs-11">You'll gain access to special features of mchp, such as <strong>calendar integration</strong> in your College Pulse and in each of your class's activity sections.</div>
                </div>
                <hr>
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <!-- Table -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Class Name</th>
                            <th># of Assignments</th>
                            <th>Unlock</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><i class="fa fa-book"></i> ECON 200</td>
                            <td><strong class="text-primary"><i class="fa fa-calendar"></i> 15 now</strong> + all future</td>
                            <td><i class="fa fa-check-circle text-success"> yes</i>
                            </td>
                        </tr>
                        <tr>
                            <td><i class="fa fa-book"></i> ACCT 210</td>
                            <td><strong class="text-primary"><i class="fa fa-calendar"></i> 22 now</strong> + all future</td>
                            <td><i class="fa fa-check-circle text-success"> yes</i>
                            </td>
                        </tr>
                        <tr>
                            <td><i class="fa fa-book"></i> MGMT 310</td>
                            <td><strong class="text-primary"><i class="fa fa-calendar"></i> 30 now</strong> + all future</td>
                            <td> <i class="fa fa-check-circle text-success"> yes</i>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="panel-footer text-center">You're unlocking: <strong>3 classes</strong> for <strong>300 points</strong>
                    </div>
                </div>
                <!-- Begin Carousel -- <div id="carousel-example-generic" class="carousel slide">

<!-- Indicators
<ol class="carousel-indicators">
<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
<li data-target="#carousel-example-generic" data-slide-to="1"></li>
<li data-target="#carousel-example-generic" data-slide-to="2"></li>
</ol>-->
                <!-- Wrapper for slides -- <div class="carousel-inner">
<div class="item ">
    <div class="custom-content">
  <div class="media">
<a class="pull-left" href="#">
<img class="media-object" src="https://s3-us-west-2.amazonaws.com/mchpstatic/calendar.svg" alt="...">
</a>
<div class="media-body">
<h4 class="media-heading">Poop Assignments</h4>
<p>Any assignment shared by any of your classmates will be visible to you, and you'll get the option to add it to your own calendar. This includes any assignment that is updated or edited throughout the semester.</p>
</div>
</div>
        </div>

</div>

</div>


              <div class="carousel-inner">
<div class="item ">
    <div class="custom-content">
  <div class="media">
<a class="pull-left" href="#">
<img class="media-object" src="https://s3-us-west-2.amazonaws.com/mchpstatic/calendar.svg" alt="...">
</a>
<div class="media-body">
<h4 class="media-heading">Poop Assignments</h4>
<p>Any assignment shared by any of your classmates will be visible to you, and you'll get the option to add it to your own calendar. This includes any assignment that is updated or edited throughout the semester.</p>
</div>
</div>
        </div>

</div>

</div>


<div class="carousel-inner">
<div class="item active">
    <div class="custom-content">
  <div class="media">
<a class="pull-left" href="#">
<img class="media-object" src="https://s3-us-west-2.amazonaws.com/mchpstatic/calendar.svg" alt="...">
</a>
<div class="media-body">
<h4 class="media-heading">Shared Assignments</h4>
<p>Any assignment shared by any of your classmates will be visible to you, and you'll get the option to add it to your own calendar. This includes any assignment that is updated or edited throughout the semester.</p>
</div>
</div>
        </div>

</div>

</div>




<!-- Controls --
<p class="pull-right">
    <a class="" href="#carousel-example-generic" data-slide="prev"><i class="fa fa-hand-o-left fa-lg"></i></a>
    <a class="" href="#carousel-example-generic" data-slide="next"><i class="fa fa-hand-o-right fa-lg"></i></a>

</p>
</div>

          <!-- End Carousel --></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success">Unlock!</button>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->
</body>
