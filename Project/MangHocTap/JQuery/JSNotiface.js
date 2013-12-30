$(function () {
    var kt1 = 0;
    //an hien noti ban be: 
    $('.naviul li.banbe').click(function () {
        if (kt1 == 0) {
            kt1 = 1;
            $('.naviul li ul.ulbanbe').css({ 'display': 'block' });
            $('.notifriend').css({ 'background-position': '-10px -66px' });

            //an 2 cai khac
            kt2 = kt3 = 0;
            $('.naviul li ul.ultinnhan').css({ 'display': 'none' });
            $('.messagenormal').css({ 'background-position': '-66px -118px' });

            $('.naviul li ul.ulthongbao').css({ 'display': 'none' });
            $('.nottifinormal').css({ 'background-position': '-116px -116px' });
        }
        else {
            kt1 = 0;
            $('.naviul li ul.ulbanbe').css({ 'display': 'none' });
            $('.notifriend').css({ 'background-position': '-10px -6px' });
        }

    });

    //an hien noti tin nhan:
    var kt2 = 0;
    $('.naviul li.tinnhan').click(function () {
        if (kt2 == 0) {
            kt2 = 1;
            $('.naviul li ul.ultinnhan').css({ 'display': 'block' });
            $('.messagenormal').css({ 'background-position': '-66px -180px' });
            //an 2 cai khac
            kt1 = kt3 = 0;
            $('.naviul li ul.ulbanbe').css({ 'display': 'none' });
            $('.notifriend').css({ 'background-position': '-10px -6px' });

            $('.naviul li ul.ulthongbao').css({ 'display': 'none' });
            $('.nottifinormal').css({ 'background-position': '-116px -116px' });
        }
        else {
            kt2 = 0;
            $('.naviul li ul.ultinnhan').css({ 'display': 'none' });
            $('.messagenormal').css({ 'background-position': '-66px -118px' });
        }

    });

    //an hien noti thong bao:
    var kt3 = 0;
    $('.naviul li.thongbao').click(function () {
        if (kt3 == 0) {
            kt3 = 1;
            $('.naviul li ul.ulthongbao').css({ 'display': 'block' });
            $('.nottifinormal').css({ 'background-position': '-116px -180px' });
            //an 2 cai khac
            kt1 = kt2 = 0;
            $('.naviul li ul.ulbanbe').css({ 'display': 'none' });
            $('.notifriend').css({ 'background-position': '-10px -6px' });

            $('.naviul li ul.ultinnhan').css({ 'display': 'none' });
            $('.messagenormal').css({ 'background-position': '-66px -118px' });
        }
        else {
            kt3 = 0;
            $('.naviul li ul.ulthongbao').css({ 'display': 'none' });
            $('.nottifinormal').css({ 'background-position': '-116px -116px' });
        }

    });



    $(document).click(function () {
        $('.naviul li ul').css({ 'display': 'none' });
        $('.notifriend').css({ 'background-position': '-10px -6px' });
        $('.messagenormal').css({ 'background-position': '-66px -118px' });
        $('.nottifinormal').css({ 'background-position': '-116px -116px' });
        kt1 = kt2 = kt3 = 0;

    });

    $('.naviul li').click(function (event) {
        event.stopPropagation();
    });

});