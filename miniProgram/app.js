import {Token} from "./services/token";

App({
  onLaunch: function () {
    Token.verify()
  }
})
