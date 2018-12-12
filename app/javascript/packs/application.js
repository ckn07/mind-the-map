import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '../components/menu_mobile';

initMapbox();

import { copyToClipboard } from '../components/copy_to_clipboard'
window.copyToClip = copyToClipboard
