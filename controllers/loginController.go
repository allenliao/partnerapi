package controllers

import "github.com/astaxie/beego"

type LoginController struct {
	beego.Controller
}

func (loginController *LoginController) Post() {
	//Hard code 一份 JSON 去BY PASS 驗證吧
	loginController.Ctx.Output.Body([]byte("bob"))
}
