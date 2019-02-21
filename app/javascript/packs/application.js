import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initAutocomplete } from '../components/init_autocomplete';
initAutocomplete();

import { initMapbox } from '../components/init_mapbox.js';
initMapbox();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();