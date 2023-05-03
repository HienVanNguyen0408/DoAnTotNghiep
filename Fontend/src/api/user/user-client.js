import HttpClient from "../base/http-client";

export default class UserClient extends HttpClient{
    constructor(){
        super("User");
    }
}
