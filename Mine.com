<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Bujjjiiii ❤️ Bunny</title>

<style>
body{
    margin:0;
    font-family:'Segoe UI',sans-serif;
    background:linear-gradient(135deg,#ff4d6d,#ff85a2);
    color:white;
    text-align:center;
    overflow:hidden;
}
.hidden{display:none;}
button{
    padding:15px 35px;
    font-size:1.1em;
    border:none;
    border-radius:40px;
    cursor:pointer;
    margin:12px;
    transition:0.3s;
}
button:hover{transform:scale(1.05);}

.envelope{
    width:260px;height:180px;
    background:white;
    margin:120px auto;
    border-radius:10px;
    position:relative;
    cursor:pointer;
}
.envelope:before{
    content:"";
    position:absolute;
    border-left:130px solid transparent;
    border-right:130px solid transparent;
    border-top:90px solid #ff4d6d;
}
.envelope span{
    position:absolute;
    bottom:20px;
    left:50%;
    transform:translateX(-50%);
    color:#ff4d6d;
    font-weight:bold;
}

.letter{
    background:white;
    color:#ff4d6d;
    padding:35px;
    margin:40px auto;
    max-width:800px;
    border-radius:20px;
}

.float-heart{
    position:fixed;
    bottom:-30px;
    animation:floatUp 6s linear forwards;
    pointer-events:none;
}
@keyframes floatUp{
    from{transform:translateY(0);opacity:1;}
    to{transform:translateY(-110vh);opacity:0;}
}
</style>
</head>

<body>

<audio id="music" loop>
  <source src="https://cdn.pixabay.com/audio/2022/03/15/audio_8d1e7f0d9b.mp3">
</audio>

<div id="envelope" class="envelope" onclick="openLetter()">
    <span>Tap to Open 💌</span>
</div>

<div id="l1" class="hidden letter">
<h2>My Dearest Bujjjiiii 💖</h2>
<p>You are safe here… always. With me.</p>
<button onclick="next(1)">Continue 💕</button>
</div>

<div id="l2" class="hidden letter">
<p>
You never have to rush.  
Your comfort means everything to me.
</p>
<button onclick="next(2)">One More 💝</button>
</div>

<div id="l3" class="hidden letter">
<p>
This letter is my heart,  
written gently for you ❤️
</p>
<button onclick="showMain()">Open My Heart 💘</button>
</div>

<div id="main" class="hidden">

<h1>Happy Valentine’s Day 💖</h1>
<h2>My Bujjjiiii 💖</h2>

<p>
With me, you’ll always be respected,  
heard, and deeply cared for.
</p>

<h2>Will You Be My Valentine Forever? 💍</h2>

<div id="options">
<button onclick="showYes()">YES FOREVER ❤️</button>
<button onclick="showShy()">I’M SHY 🙈</button>
</div>

<div id="yesAns" class="hidden">
<h2>I love you Bujjjiiii 💞</h2>
<p>
My heart chooses you — softly, endlessly.
</p>
</div>

<div id="shyAns" class="hidden">
<h3>Your shyness is my favorite 💕</h3>
<p>
Take your time… I’m right here.
</p>
</div>

<!-- 💍 MARRIAGE SECTION -->
<h2 style="margin-top:40px;">Will You Marry Me? 💍</h2>

<div id="marryOptions">
<button onclick="marryYes()">YES 💍</button>
<button onclick="marryShy()">I’M BLUSHING 🙈</button>
</div>

<div id="marryYesAns" class="hidden">
<h2>You Just Made My Life Complete 💖</h2>
<p>
I promise to stand by you,  
care for you,  
and love you every single day of our lives.
</p>
<p>
You are my forever, Bujjjiiii 💍
</p>
</div>

<div id="marryShyAns" class="hidden">
<h3>Your blush says everything 😳💞</h3>
<p>
Even your silence feels like a yes to my heart.
</p>
<p>
I’ll wait, smile, and love you patiently… always.
</p>
</div>

<p><b>Forever yours,<br>Bunny 🫶</b></p>

</div>

<script>
function openLetter(){
    envelope.style.display="none";
    l1.classList.remove("hidden");
    music.play();
    hearts();
}
function next(n){
    document.getElementById("l"+n).classList.add("hidden");
    document.getElementById("l"+(n+1)).classList.remove("hidden");
}
function showMain(){
    l3.classList.add("hidden");
    main.classList.remove("hidden");
}
function showYes(){
    shyAns.classList.add("hidden");
    yesAns.classList.remove("hidden");
}
function showShy(){
    yesAns.classList.add("hidden");
    shyAns.classList.remove("hidden");
}
function marryYes(){
    marryShyAns.classList.add("hidden");
    marryYesAns.classList.remove("hidden");
}
function marryShy(){
    marryYesAns.classList.add("hidden");
    marryShyAns.classList.remove("hidden");
}
function hearts(){
    setInterval(()=>{
        let h=document.createElement("div");
        h.className="float-heart";
        h.innerHTML="❤️";
        h.style.left=Math.random()*100+"vw";
        h.style.fontSize=Math.random()*20+15+"px";
        document.body.appendChild(h);
        setTimeout(()=>h.remove(),6000);
    },400);
}
</script>

</body>
</html>
