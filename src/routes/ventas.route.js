const express = require('express');
const router = express.Router();
const CrudController = require('../controllers/crud.controller');
const crud = new CrudController();
const tabla = 'ventas';
const idCampo = 'id_venta';

router.get('/', async (req, res) => {
    try {
        const ventas = await crud.obtenerTodos(tabla);
        res.json(ventas);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.get('/:id', async (req, res) => {
    try {
        const venta = await crud.obtenerUno(tabla, idCampo, req.params.id);
        res.json(venta);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.post('/', async (req, res) => {
    try {
        const nuevaVenta = await crud.crear(tabla, req.body);
        res.status(201).json(nuevaVenta);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.put('/:id', async (req, res) => {
    try {
        const ventaActualizada = await crud.actualizar(tabla, idCampo, req.params.id, req.body);
        res.json(ventaActualizada);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.delete('/:id', async (req, res) => {
    try {
        const resultado = await crud.eliminar(tabla, idCampo, req.params.id);
        res.json(resultado);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;