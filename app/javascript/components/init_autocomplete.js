import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('inputCity');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };