import css from '../css/app.css'

import "phoenix_html"

import {Socket, LongPoll} from "phoenix"
import LiveSocket from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {transport: LongPoll, params: {_csrf_token: csrfToken}});
liveSocket.connect()
