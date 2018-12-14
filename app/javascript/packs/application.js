import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '../components/menu_mobile';
import '../components/score_mobile';


initMapbox();


import { copyToClipboard } from '../components/copy_to_clipboard';
window.copyToClip = copyToClipboard

import { hideSolo } from '../components/showChallenges';

if (document.getElementById('show-user')){
  hideSolo();
};
