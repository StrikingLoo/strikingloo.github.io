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
  <input type="color" value="#ff0000" id="rawColorInput" />
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
    const colorPicker = document.getElementById('rawColorInput');
    

    function updateColor() {
      const hue = hueInput.value;

      const baseColor = `hsl(${hue}, 70%, 50%)`;
      const darkColor = `hsl(${hue}, 80%, 10%)`;
      const lightColor = `hsl(${hue}, 70%, 95%)`;

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

    function hexToHSL(hex) {
      // Remove # if present
      hex = hex.replace(/^#/, '');
      
      // Parse the hex values
      let r, g, b;
      if (hex.length === 3) {
        r = parseInt(hex[0] + hex[0], 16) / 255;
        g = parseInt(hex[1] + hex[1], 16) / 255;
        b = parseInt(hex[2] + hex[2], 16) / 255;
      } else {
        r = parseInt(hex.substr(0, 2), 16) / 255;
        g = parseInt(hex.substr(2, 2), 16) / 255;
        b = parseInt(hex.substr(4, 2), 16) / 255;
      }
      
      // Find min and max
      const max = Math.max(r, g, b);
      const min = Math.min(r, g, b);
      let h, s, l = (max + min) / 2;
      
      if (max === min) {
        // Achromatic
        h = s = 0;
      } else {
        const d = max - min;
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
        
        switch (max) {
          case r: h = (g - b) / d + (g < b ? 6 : 0); break;
          case g: h = (b - r) / d + 2; break;
          case b: h = (r - g) / d + 4; break;
        }
        h /= 6;
      }
    
    // Convert to degrees and percentages
      return {
        h: Math.round(h * 360),
        s: Math.round(s * 100),
        l: Math.round(l * 100)
      };
    }

    function colorPickerUpdate() {
      const baseColor = colorPicker.value;
      const {h, s, l} = hexToHSL(colorPicker.value);

      const darkColor = `hsl(${h}, 80%, ${l < 50 ? 10 : 90}%)`;
      const lightColor = `hsl(${h}, 70%, ${l < 50 ? 90 : 20}%)`;

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

    hueInput.addEventListener('change', updateColor);
    colorPicker.addEventListener('change', colorPickerUpdate, false);
    updateColor();
  </script>