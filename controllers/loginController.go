package controllers

import (
	"encoding/json"
	"fmt"

	"log"

	"github.com/astaxie/beego"
)

type LoginController struct {
	beego.Controller
}

type APIGameLoginInput struct {
	Token string
}

func (loginController *LoginController) Post() {
	//Hard code 一份 JSON 去BY PASS 驗證吧

	var inputObj APIGameLoginInput
	json.Unmarshal(loginController.Ctx.Input.RequestBody, &inputObj) //把JSON值塞進Object去
	var responseJsonStr string
	log.Printf("RequestBody: %v ", string(loginController.Ctx.Input.RequestBody))
	log.Printf("inputObj.Token: %v ", inputObj.Token)
	if inputObj.Token == "aaaaaaaa" {

		responseJsonStr = fmt.Sprintf(`
		{
			"Statuscode":"%v",
			"Membercode":"%v",
			"Balance":%v
		}
		`, "000000", "Allen", 80000)
	} else {
		responseJsonStr = fmt.Sprintf(`
			{
				"Statuscode":"%v",
				"Msg":"%v"
			}
			`, "000001", "token expired")
	}

	loginController.Ctx.Output.Body([]byte(responseJsonStr))

}
