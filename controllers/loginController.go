package controllers

import (
	"fmt"

	"github.com/astaxie/beego"
)

type LoginController struct {
	beego.Controller
}

func (loginController *LoginController) Post() {
	//Hard code 一份 JSON 去BY PASS 驗證吧

	responseSuccJsonStr := fmt.Sprintf(`
		{
			"Statuscode":"%v",
			"Membercode":"%v",
			"Balance":%v
		}
		`, "000000", "Allen", 80000)
	loginController.Ctx.Output.Body([]byte(responseSuccJsonStr))

	/*
			responseFailJsonStr := fmt.Sprintf(`
			{
				"Statuscode":"%v",
				"Msg":"%v"
			}
			`, "000001", "session timeout")

			loginController.Ctx.Output.Body([]byte(responseFailJsonStr))

		loginController.Ctx.Output.Body([]byte(responseFailJsonStr))
	*/
}
