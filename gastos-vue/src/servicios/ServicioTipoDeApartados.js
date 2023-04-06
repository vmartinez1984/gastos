import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'TiposDeApartados/'

export default{
    async obtenerTodoAsync(){
        var response

        response = await axios({
            url: url,
            method: 'GET'
        })

        return response.data
    }
}