/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const themeMap = {
  dark: "light",
  light: "solar",
  solar: "dark"
};
const theme = localStorage.getItem('theme')
        || (tmp = Object.keys(themeMap)[0],
                localStorage.setItem('theme', tmp),
                tmp);
const bodyClass = document.body.classList;
bodyClass.add(theme);

function toggleTheme() {
    const current = localStorage.getItem('theme');
    const next = themeMap[current];

    bodyClass.add('transition');
    bodyClass.replace(current, next);

    // Wait for the transition to complete before removing the transition class
    setTimeout(() => {
        bodyClass.remove('transition');
    }, 500);

    localStorage.setItem('theme', next);
}

document.getElementById('themeButton').onclick = toggleTheme;



