----------------------------------------------------------------------------------------------------------------------------------------
-- CARGA INICIAL --
----------------------------------------------------------------------------------------------------------------------------------------

--DELETE
DELETE FROM me_encuesta_alternativa;
DELETE FROM me_encuesta_tema;

--INSERT
INSERT INTO `me_encuesta_tema` (`ente_codigo`, `ente_tema`, `ente_detalles`, `ente_estado`) VALUES ('FRUTA_FAV', 'Fruta Favorita', NULL, 'A');
INSERT INTO `me_encuesta_tema` (`ente_codigo`, `ente_tema`, `ente_detalles`, `ente_estado`) VALUES ('LP_FAVORIT', 'Lenguaje de Programación favorito', NULL, 'A');

INSERT INTO `me_encuesta_alternativa` (`enalt_id`, `ente_codigo`, `enalt_opcion`, `enalt_estado`) VALUES (1, 'LP_FAVORIT', 'JAVA', 'A');
INSERT INTO `me_encuesta_alternativa` (`enalt_id`, `ente_codigo`, `enalt_opcion`, `enalt_estado`) VALUES (2, 'LP_FAVORIT', 'C#', 'A');

COMMIT;