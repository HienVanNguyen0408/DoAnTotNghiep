import { BASE_URL } from '@/api/url';

const KeyJWT = "Jwt";
class AuthService {
    async login(user) {
        return await axios
            .post(BASE_URL + '/login', {
                username: user.username,
                password: user.password
            })
            .then(response => {
                if (response.data){
                    localStorage.setItem(KeyJWT, JSON.stringify(response.data));
                }
                return response.data;
            });
    }
    logout() {
        localStorage.removeItem(KeyJWT);
    }
    async register(user) {
        return await axios.post(BASE_URL + '/register', {
            username: user.username,
            password: user.password
        });
    }
}

export default new AuthService();