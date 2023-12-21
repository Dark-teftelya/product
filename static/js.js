
document.addEventListener("DOMContentLoaded", function () {
    const title = document.querySelector(".about-us h2");
    const paragraph = document.querySelector(".about-us p");

    // Задержка перед началом анимации (в данном случае 500 миллисекунд)
    setTimeout(function () {
        title.style.transform = "translateY(0)";
    }, 500);

    // Задержка перед началом анимации абзаца
    setTimeout(function () {
        paragraph.style.transform = "translateY(0)";
    }, 1100); // Задержка в 1000 миллисекунд (1 секунда) после загрузки страницы
});

function buttonClick() {
    var file = document.getElementById('file').files[0];
    var reader = new FileReader();
    // it's onload event and you forgot (parameters)
    // Display loading view while the file is being loaded
    var block = document.querySelector('.left-side .main');
    block.innerHTML = '<div class="preloader"><div class="text">ЗАГРУЗКА...</div><img src="static/kitty.gif" class="gif" alt="гифка"></div>';


    // Start loading the file
    setTimeout(function () {
        // it's onload event and you forgot (parameters)
        reader.onload = function (e) {
            block.innerHTML = ''; // Clear the loading view
            var content = document.createElement("div");
            content.setAttribute("class","audio-content")
            block.appendChild(content);
            

            var audio = document.createElement("audio");
            // the result audio data
            audio.src = e.target.result;
            audio.controls = true;
            content.appendChild(audio);
            var pFileName = document.createElement("p");
            pFileName.setAttribute("class", "song-name")
            pFileName.textContent = file.name;
            content.insertBefore(pFileName, audio);

            var inputDownload = document.createElement("input");
            var labelDownload = document.createElement("label");
            var p = document.createElement("p");
            var inputHandler = document.createElement("input");
            var labelHandler = document.createElement("label");
            var p2 = document.createElement("p");

            inputDownload.setAttribute("type", "file");
            inputDownload.setAttribute("id", "file");
            inputDownload.setAttribute("name", "file");
            inputDownload.setAttribute("onchange", "buttonClick()");
            inputDownload.setAttribute("accept", "audio/mp3");
            inputDownload.setAttribute("class", "display-none");

            labelDownload.setAttribute("for", "file");
            var text = "Выбрать другой файл";

            p.textContent = text;
            content.appendChild(inputDownload);
            content.appendChild(labelDownload);
            labelDownload.appendChild(p);

            inputHandler.setAttribute("type", "button");
            inputHandler.setAttribute("id", "handlerbtn");
            inputHandler.setAttribute("name", "btn");
            inputHandler.setAttribute("class", "display-none");

            labelHandler.setAttribute("for", "btn");
            text = "Распознать музыку";

            p2.textContent = text;
            content.appendChild(inputHandler);
            content.appendChild(labelHandler);
            labelHandler.appendChild(p2);
        }

        // you have to declare the file loading
        reader.readAsDataURL(file);

    }, 5000); // Set a timeout of 2 seconds
}