import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Change your Life", "Click &#38; Fly"],
    typeSpeed: 45,
    loop: false,
  });
};

export { loadDynamicBannerText };