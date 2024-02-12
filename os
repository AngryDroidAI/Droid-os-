<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Droid OS</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: black;
            color: #00FF00; /* Green text */
            font-family: 'Courier New', Courier, monospace;
            position: relative;
        }

        .taskbar {
            display: flex;
            justify-content: flex-end;
            height: 40px;
            background-color: #333;
            padding: 5px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
        }

        .taskbar-title {
            color: white;
            margin-right: auto;
            padding: 0 10px;
        }

        .start-menu {
            display: none;
            position: absolute;
            top: 40px;
            left: 0;
            background-color: #333;
            color: white;
            padding: 10px;
            z-index: 3; /* Ensure start menu is above the windows */
            border: 2px solid #00FF00; /* Green outline */
        }

        .icons {
            display: flex;
            border: 2px solid #00FF00; /* Green outline */
            padding: 5px;
            border-radius: 5px;
        }

        .icon {
            margin-right: 10px;
            cursor: pointer;
        }

        .clock {
            margin-left: auto;
        }

        .window {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            height: 300px;
            background-color: #000;
            color: #00FF00;
            border: 1px solid #00FF00;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            z-index: 4; /* Ensure windows are above the taskbar */
            overflow: hidden; /* Hide content overflow */
        }

        .title-bar {
            background-color: #333;
            color: white;
            padding: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: move; /* Make title bar draggable */
        }

        .close-button,
        .minimize-button,
        .maximize-button {
            cursor: pointer;
            margin-right: 5px;
        }

        .close-button:hover,
        .minimize-button:hover,
        .maximize-button:hover {
            color: red;
        }

        .content {
            padding: 10px;
            overflow: auto; /* Allow content scrolling */
            height: calc(100% - 30px); /* Adjust content height */
        }

        .search-bar {
            width: 100%;
            padding: 5px;
            background-color: #000;
            color: #00FF00;
            border: 1px solid #00FF00;
            outline: none;
            margin-bottom: 10px;
        }

        /* Droid Radar styles */
        .background {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .radar {
            width: 200px;
            height: 200px;
            background: radial-gradient(circle, rgba(0,0,0,1) 0%, rgba(0,0,0,1) 46%, rgba(0,0,0,0.7240455182072829) 100%);
            border-radius: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            overflow: hidden;
        }

        .scanning-hand {
            width: 3px;
            height: 50%;
            background-color: #00FF00;
            position: absolute;
            top: 50%;
            left: 50%;
            transform-origin: top center;
            animation: scan 2s infinite linear;
        }

        @keyframes scan {
            0% {
                transform: translate(-50%, -50%) rotate(0deg);
            }
            100% {
                transform: translate(-50%, -50%) rotate(360deg);
            }
        }

        .wifi-details, .network-speed {
            margin-top: 10px;
        }

        /* Add more styling as needed */
    </style>
    <script>
        // Start drag function
        function startDrag(e, windowId) {
            var window = document.getElementById(windowId);
            var offsetX = e.clientX - window.getBoundingClientRect().left;
            var offsetY = e.clientY - window.getBoundingClientRect().top;
            document.onmousemove = function (e) {
                var x = e.clientX - offsetX;
                var y = e.clientY - offsetY;
                window.style.left = x + 'px';
                window.style.top = y + 'px';
            }
            document.onmouseup = function () {
                document.onmousemove = null;
            }
        }

        // Toggle Start Menu
        function toggleStartMenu() {
            var startMenu = document.getElementById('startMenu');
            startMenu.style.display = startMenu.style.display === 'block' ? 'none' : 'block';
        }

        // Open File Explorer Window
        function openFileManager() {
            var fileExplorerWindow = document.getElementById('fileExplorerWindow');
            fileExplorerWindow.style.display = 'block';
        }

        // Open Terminal Window
        function openTerminal() {
            var terminalWindow = document.getElementById('terminalWindow');
            terminalWindow.style.display = 'block';
        }

        // Open Droid Radar Window
        function openDroidRadar() {
            var droidRadarWindow = document.getElementById('droidRadarWindow');
            droidRadarWindow.style.display = 'block';
        }

        // Open Photos Window
        function openPhotos() {
            var photosWindow = document.getElementById('photosWindow');
            photosWindow.style.display = 'block';
        }

        // Open Videos Window
        function openVideos() {
            var videosWindow = document.getElementById('videosWindow');
            videosWindow.style.display = 'block';
        }

        // Open Music Window
        function openMusic() {
            var musicWindow = document.getElementById('musicWindow');
            musicWindow.style.display = 'block';
        }

        // Handle Search
        function searchDuckDuckGo() {
            var query = prompt('Enter your search query:');
            if (query) {
                window.open(`https://duckduckgo.com/?q=${query}`);
            }
        }

        // Open Galactic Mayhem Neon Skies in a new window
        function openGalacticMayhemNeonSkies() {
            window.open("https://hgalactic-mayhem-neon-skies.tiiny.site");
        }

        // Close Window
        function closeWindow(windowId) {
            var window = document.getElementById(windowId);
            window.style.display = 'none';
        }

        // Minimize Window
        function minimizeWindow(windowId) {
            var window = document.getElementById(windowId);
            window.style.display = 'none';
        }

        // Maximize Window
        function maximizeWindow(windowId) {
            var window = document.getElementById(windowId);
            if (window.style.width !== '100%' && window.style.height !== '100%') {
                window.style.width = '100%';
                window.style.height = '100%';
                window.style.left = '0';
                window.style.top = '0';
            } else {
                window.style.width = '400px';
                window.style.height = '300px';
                window.style.left = '50%';
                window.style.top = '50%';
                window.style.transform = 'translate(-50%, -50%)';
            }
        }
    </script>
</head>
<body>
    <div class="taskbar">
        <div class="taskbar-title">Droid OS</div>
        <div class="icons">
            <div class="icon" onclick="toggleStartMenu()">Start</div>
            <!-- Add other icons as needed -->
            <div class="clock">12:00 PM</div>
        </div>
    </div>

    <div class="start-menu" id="startMenu">
        <input type="text" class="search-bar" placeholder="Search">
        <ul>
            <li onclick="openFileManager()">File Explorer</li>
            <li onclick="openTerminal()">Terminal</li>
            <li onclick="openDroidRadar()">Droid Radar</li>
            <li onclick="searchDuckDuckGo()">Search</li>
            <li onclick="openPhotos()">Photos</li>
            <li onclick="openVideos()">Videos</li>
            <li onclick="openMusic()">Music</li>
            <!-- Add Galactic Mayhem Neon Skies link -->
            <li onclick="openGalacticMayhemNeonSkies()">Galactic Mayhem Neon Skies</li>
        </ul>
    </div>

    <div class="window" id="fileExplorerWindow">
        <div class="title-bar" onmousedown="startDrag(event, 'fileExplorerWindow')">
            File Explorer
            <span class="close-button" onclick="closeWindow('fileExplorerWindow')">X</span>
        </div>
        <div class="content">
            <!-- File Explorer content goes here -->
            <p>File Explorer content goes here.</p>
        </div>
    </div>

    <div class="window" id="terminalWindow">
        <div class="title-bar" onmousedown="startDrag(event, 'terminalWindow')">
            Terminal
            <span class="minimize-button" onclick="minimizeWindow('terminalWindow')">-</span>
            <span class="maximize-button" onclick="maximizeWindow('terminalWindow')">□</span>
            <span class="close-button" onclick="closeWindow('terminalWindow')">X</span>
        </div>
        <div class="content">
            <div class="matrix-bg"></div>

            <div class="terminal">
                <div class="terminal-header">Droid Terminal</div>
                <div class="terminal-body" id="terminal-body">
                    <p>Welcome to the future.</p>
                    <p>Type 'help' for assistance.</p>
                    <p class="output"></p>
                </div>
                <div class="terminal-input">
                    <span>$&nbsp;</span><input type="text" id="command-line" autofocus>
                </div>
            </div>
        </div>
    </div>

    <div class="window" id="droidRadarWindow">
        <div class="title-bar" onmousedown="startDrag(event, 'droidRadarWindow')">
            Droid Radar
            <span class="minimize-button" onclick="minimizeWindow('droidRadarWindow')">-</span>
            <span class="maximize-button" onclick="maximizeWindow('droidRadarWindow')">□</span>
            <span class="close-button" onclick="closeWindow('droidRadarWindow')">X</span>
        </div>
        <div class="content">
            <!-- Droid Radar content goes here -->
            <div class="background">
                <canvas id="matrix-effect"></canvas>
                <div class="radar">
                    <div class="scanning-hand"></div>
                </div>
            </div>
            <div class="wifi-details">
                <div class="wifi-strength">Wi-Fi Strength: <span id="strength"></span></div>
                <div class="distance">Distance: <span id="distance"></span></div>
                <div class="ip-address">IP Address: <span id="ip-address"></span></div>
                <div class="isp-distance">ISP Distance: <span id="isp-distance"></span></div>
            </div>
            <div class="network-speed">
                <div class="download-speed">Download Speed: <span id="download-speed"></span> Mbps</div>
                <div class="upload-speed">Upload Speed: <span id="upload-speed"></span> Mbps</div>
            </div>
        </div>
    </div>

    <div class="window" id="photosWindow">
        <div class="title-bar" onmousedown="startDrag(event, 'photosWindow')">
            Photos
            <span class="minimize-button" onclick="minimizeWindow('photosWindow')">-</span>
            <span class="maximize-button" onclick="maximizeWindow('photosWindow')">□</span>
            <span class="close-button" onclick="closeWindow('photosWindow')">X</span>
        </div>
        <div class="content">
            <!-- Photos content goes here -->
            <p>Photos content goes here.</p>
        </div>
    </div>

    <div class="window" id="videosWindow">
        <div class="title-bar" onmousedown="startDrag(event, 'videosWindow')">
            Videos
            <span class="minimize-button" onclick="minimizeWindow('videosWindow')">-</span>
            <span class="maximize-button" onclick="maximizeWindow('videosWindow')">□</span>
            <span class="close-button" onclick="closeWindow('videosWindow')">X</span>
        </div>
        <div class="content">
            <!-- Videos content goes here -->
            <p>Videos content goes here.</p>
        </div>
    </div>

    <div class="window" id="musicWindow">
        <div class="title-bar" onmousedown="startDrag(event, 'musicWindow')">
            Music
            <span class="minimize-button" onclick="minimizeWindow('musicWindow')">-</span>
            <span class="maximize-button" onclick="maximizeWindow('musicWindow')">□</span>
            <span class="close-button" onclick="closeWindow('musicWindow')">X</span>
        </div>
        <div class="content">
            <!-- Music content goes here -->
            <p>Music content goes here.</p>
        </div>
    </div>
</body>
</html>
