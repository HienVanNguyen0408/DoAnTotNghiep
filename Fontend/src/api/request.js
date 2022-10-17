import axios from 'axios';
import { BASE_URL } from './url.js'
import Auth from '@/auth/auth';
/**
 * Khởi tạo config mặc định axios 
 * CreatedBy: NVHIEN 14/6/2021
// */
export default axios.create({
    baseURL: BASE_URL,
    headers: {
        'Authorization': `Bearer ${Auth.getTokenStorage()}` 
    }
    
});