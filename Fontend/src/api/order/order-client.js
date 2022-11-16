import HttpClient from "../base/http-client";

export default class OrderClient extends HttpClient{
    constructor(){
        super("Order");
    }
}
