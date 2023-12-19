<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<style>
    body {
        margin: 7px;
        width: 330px;
        height: 445px;
    }

    /* 대화창 스타일 */
    #chatWindow {
        border: 1px solid #e5e5e5;
        width: 100%;
        height: 92%;
        overflow-y: scroll;
        background-color: #f7f7f7;
        margin-bottom: 5px;
    }

    #inputSection {
        height: 8%;
        display: flex;
    }

    /* 메시지 입력창 스타일 */
    #chatMessage {
        border: 1px solid #e5e5e5;
        border-radius: 4px;
        padding: 5px;
        margin-right: 5px;
        font-size: 14px;
        width: 70%;
    }

    /* 전송 버튼 스타일 */
    #sendBtn {
        padding: 0 15px;
        border: none;
        border-radius: 4px;
        background-color: #0070c9;
        color: #fff;
        font-size: 14px;
        cursor: pointer;
        width: 30%;
    }

    /* 사용자가 보낸 메시지 스타일 */
    .myMsg {
        text-align: right;
        background-color: #e5e5e5;
        color: #000;
        padding: 8px;
        margin-bottom: 10px;
        border-radius: 4px;
        font-size: 14px;
        margin-left: 8px;
    }

    /* 상담원이 보낸 메시지 스타일 */
    .otherMsg {
        text-align: left;
        background-color: #808080;
        color: #fff;
        padding: 8px;
        margin-bottom: 10px;
        border-radius: 4px;
        font-size: 14px;
        margin-left: 8px;
    }
    /* 스크롤바 디자인 변경 */
    #chatWindow::-webkit-scrollbar {
        width: 8px;
    }

    #chatWindow::-webkit-scrollbar-track {
        background-color: #f7f7f7;
    }

    #chatWindow::-webkit-scrollbar-thumb {
        background-color: #888;
        border-radius: 4px;
    }

    #chatWindow::-webkit-scrollbar-thumb:hover {
        background-color: #555;
    }
</style>
<head>
    <title>채팅</title>
    <script>
        var webSocket = new WebSocket("ws://localhost:8090/ChatingServer");
        var chatWindow, chatMessage, chatId = '${param.chatId}';

        // 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
        window.onload = function() {
            chatWindow = document.getElementById("chatWindow");
            chatMessage = document.getElementById("chatMessage");
        }
        // 메시지 전송
        function sendMessage() {
            // 입력 된 문자 없이 전송을 누를 경우 반영하지 않음
            if (chatMessage.value === "") {
                return 0;
            }
            // 대화창에 표시
            chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>"
            webSocket.send(chatId + '|' + chatMessage.value);  // 서버로 전송
            chatMessage.value = "";  // 메시지 입력창 내용 지우기
            chatWindow.scrollTop = chatWindow.scrollHeight;  // 대화창 스크롤
        }

        // 서버와의 연결 종료
        function disconnect() {
            webSocket.close();
        }

        // 엔터 키 입력 처리
        function enterKey() {
            if (window.event.keyCode === 13) {  // 13은 'Enter' 키의 코드값
                sendMessage();
            }
        }

        /*// 웹소켓 서버에 연결됐을 때 실행
        webSocket.onopen = function(event) {
            chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
        };

        // 웹소켓이 닫혔을 때(서버와의 연결이 끊겼을 때) 실행
        webSocket.onclose = function(event) {
            chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br/>";
        };*/

        // 에러 발생 시 실행
        webSocket.onerror = function(event) {
            alert(event.data);
            chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
        };

        // 메시지를 받았을 때 실행
        webSocket.onmessage = function(event) {
            var message = event.data.split("|");  // 대화명과 메시지 분리
            var sender = message[0];   // 보낸 사람의 대화명
            var content = message[1];  // 메시지 내용
            if (content != "") {
                if (content.match("/")) {  // 귓속말
                    if (content.match(("/" + chatId))) {  // 나에게 보낸 메시지만 출력
                        var temp = content.replace(("/" + chatId), "[귓속말] : ");
                        chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
                    }
                }
                else {  // 일반 대화
                    chatWindow.innerHTML += "<div class='otherMsg'>" + sender + " : " + content + "</div>";
                }
            }
            chatWindow.scrollTop = chatWindow.scrollHeight;
        };

    </script>
</head>

<body>  <!-- 대화창 UI 구조 정의 -->
<div id="chatWindow"></div>
<div id="inputSection">
    <input type="text" id="chatMessage" onkeyup="enterKey();">
    <button id="sendBtn" onclick="sendMessage();">전송</button>
</div>
</body>
</html>