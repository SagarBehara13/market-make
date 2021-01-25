import { Router } from 'express'
import marketData from './marketData'

const router = Router()

router.use('/api/request', marketData)

export default router
