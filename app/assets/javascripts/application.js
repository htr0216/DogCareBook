// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require bootstrap-sprockets
//= require_tree .

//= require jquery
//= require moment
//= require fullcalendar

$(function () {
  var windowWidth = window.innerWidth;
  var height = 800;
  if (windowWidth <= 670) {
    height = 650;
  }
  // 画面遷移を検知
  $(document).on('turbolinks:load', function () {
    if ($('#calendar').length) {

      function Calendar() {
        return $('#calendar').fullCalendar({
        });
      }
      function clearCalendar() {
        $('#calendar').html('');
      }

      $(document).on('turbolinks:load', function () {
        Calendar();
      });
      $(document).on('turbolinks:before-cache', clearCalendar);

      //events: '/events.json', 以下に追加
      $('#calendar').fullCalendar({
        events: '/events.json',
        //カレンダー上部を年月で表示させる
        titleFormat: 'YYYY年 M月',
        //曜日を日本語表示
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        //ボタンのレイアウト
        header: {
          left: '',
          center: 'title',
          right: 'today,prev,next'
        },
        //終了時刻がないイベントの表示間隔
        defaultTimedEventDuration: '03:00:00',
        buttonText: {
          prev: '<',
          next: '>',
          prevYear: '前年',
          nextYear: '翌年',
          today: '今日',
          month: '月',
          week: '週',
          day: '日'
        },
        height: height,
        // Drag & Drop & Resize
        editable: true,
        eventLimit: true,
        slotEventOverlap: false,
        //イベントの時間表示を２４時間に
        timeFormat: "HH:mm",
        //イベントの色を変える
        eventColor: '#87cefa',
        //イベントの文字色を変える
        eventTextColor: '#000000',
        eventRender: function(event, element) {
          element.css("font-size", "0.8em");
          console.log(event);
          if (event.category === "food") {
            //foodだったら
            element.css("background-color", "#c1fe96");
          } else if (event.category === "health") {
            //healthだったら
            element.css("background-color", "#fdb858");
          } else if (event.category === "medicine") {
            //medicineだったら
            element.css("background-color", "#f1d2ed");
          } else if (event.category === "hospital") {
            //hospitalだったら
            element.css("background-color", "#a7e4e5");
          }

          //element.css("background-color", "#fda832");
          element.css("padding", "5px");
        }
      });
    }
  });
});