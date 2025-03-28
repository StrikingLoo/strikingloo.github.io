---
layout: default
title: Monochromatic Palette Creator Tool
description: "This tool creates harmonious palettes for website designs and front-end development. Quickly test out many palettes and see them in mock website."
---
<style>
  .colorSquare {
    width: 200px;
    height: 200px;
    margin: 20px;
    border: 2px solid black;
    display: inline-block;
  }

  .contentBox {
    margin:32px;
    padding: 16px;
    border: 1px solid black;
  }
</style>
  <h1>Monochromatic Palette Creator Tool</h1>
  
  <div style="text-align:center;">
  <label for="hue" style="font-size:1.2em">Try a hue (0 to 360):</label>
  <input type="number" id="hue" value="0" min="0" max="360" style="font-size:1.2em">
  <button onclick="increment('hue')" style="font-size:1.2em">▲</button>
  <button onclick="decrement('hue')" style="font-size:1.2em">▼</button>
  <br>
  
  <div id="colorSquare" class="colorSquare"></div>
  <div id="darkColorSquare" class="colorSquare"></div>
  <div id="accentColorSquare" class="colorSquare"></div>
  </div>

  <p>Easily test out several color palettes by changing the hue. Get one darker color (e.g. for fonts), one lighter one (ideal for background) and an intermediate one for accents.</p>
  <p>The palettes are based on HSL hues.</p>

  <div id='theDiv' class="contentBox">
    <p id="theH2" style="font-weight:700;font-size:1.4em;line-height:1.5;">Lorem Ipsum</p>
    <p id="theP">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  </div>
  
  <script>
    const colorSquare = document.getElementById('colorSquare');
    const accentColorSquare = document.getElementById('accentColorSquare');
    const darkColorSquare = document.getElementById('darkColorSquare');
    const hueInput = document.getElementById('hue');

    function updateColor() {
      const hue = hueInput.value;

      const baseColor = `hsl(${hue}, 80%, 40%)`;
      const lightColor = `hsl(${hue}, 90%, 96%)`;
      const darkColor = `hsl(${hue}, 90%, 20%)`;

      colorSquare.style.backgroundColor = baseColor;
      darkColorSquare.style.backgroundColor = darkColor;
      accentColorSquare.style.backgroundColor = lightColor;

      const theDiv = document.getElementById('theDiv');
      const theH2 = document.getElementById('theH2');
      const theP = document.getElementById('theP');
      theDiv.style.backgroundColor = lightColor;
      theH2.style.color = baseColor;
      theP.style.color = darkColor;
    }

    function increment(property) {
      const input = document.getElementById(property);
      let value = parseInt(input.value);
      if (value < parseInt(input.max) - 10) {
        value+=10;
        input.value = value;
        updateColor();
      }
    }

    function decrement(property) {
      const input = document.getElementById(property);
      let value = parseInt(input.value);
      if (value > parseInt(input.min)) {
        value-=10;
        input.value = value;
        updateColor();
      }
    }

    hueInput.addEventListener('change', updateColor);
    updateColor();
  </script>