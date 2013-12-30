<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTimeline.ascx.cs" Inherits="MangHocTap.UC.ucTimeline" %>
<link href="/CSS/timeline.css" rel="stylesheet" />
<script src="/tooltipster-master/js/jquery.tooltipster.js"></script>
<script src="/tooltipster-master/js/jquery.tooltipster.min.js"></script>
<link href="/tooltipster-master/css/tooltipster.css" rel="stylesheet" />
<script src="/JQuery/jquery.jnotify.js"></script>
<link href="/CSS/jquery.jnotify.css" rel="stylesheet" />
<script>
    $(document).ready(function () {
        $('.tooltip').tooltipster({
            animation: 'fall',
            delay: 0,
            theme: '.tooltipster-punk',
            //touchDevices: true,
            onlyOne: true,
            trigger: 'hover',
        });
        $('.event').hover(function () {
            var trID = '#' + $(this).attr('id') + '_tr';
            $('.timerange').removeClass('glow');
            $(trID).addClass('glow');
        })

        $('.event').mouseout(function () {
            $('.timerange').removeClass('glow');
        });

        $('.timerange').hover(function () {
            $(this).addClass('glow');
        });
        $('.timerange').mouseout(function () {
            $(this).removeClass('glow');
        })
    });
</script>
<div id="timeline">
    <div class="main_line"></div>
    <div class="horizontal-line leftend" style="left: 0%">
        <div class="date"><%InsertToDay(); %></div>
        <div class="hour"><b>0h</b></div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 4%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 8%">
        <div class="hour">2h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 12%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 16%">
        <div class="hour">4h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 20%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 24%">
        <div class="hour">6h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 28%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 32%">
        <div class="hour">8h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 36%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 40%">
        <div class="hour">10h</div>
    </div>

    <div class="horizontal-line hour-line odd-hour" style="left: 44%"></div>
    <div class="horizontal-line hour-line even-hour " style="left: 48%">
        <div class="hour" style="color: orange"><b>12h</b></div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 52%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 56%">
        <div class="hour">14h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 60%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 64%">
        <div class="hour">16h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 68%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 72%">
        <div class="hour">18h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 76%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 80%">
        <div class="hour">20h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 84%"></div>
    <div class="horizontal-line hour-line even-hour" style="left: 88%">
        <div class="hour">22h</div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 92%"></div>
    <div class="horizontal-line rightend" style="left: 96%;">
        <div class="date"><%InsertTomorrow(); %></div>
        <div class="hour"><b>0h</b></div>
    </div>
    <div class="horizontal-line hour-line odd-hour" style="left: 100%"></div>
    <%--<div class="timerange" style="left:5.26%;width:100%"></div>    --%>


    <%BuildTimelineEvents(); %>
     <asp:Timer runat="server" Interval="3000" ID="timer" OnTick="timer_Tick" ></asp:Timer>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="timer" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
           
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
