import { Router } from 'express'
import * as landData from '../controller/landData'
import asyncJsonController from '../utils/asyncJsonController'

const router = Router()

router.post('/land', asyncJsonController(req => landData.addData(req.body)))
router.delete('/land', asyncJsonController(req => landData.deleteData(req.body)))
router.put('/land', asyncJsonController(req => landData.editData(req.body)))
router.post('/search/land', asyncJsonController(req => landData.getData(req.query)))
router.get('/land', asyncJsonController(req => landData.getEntireProperty()))

export default router
