/*
 Navicat Premium Data Transfer

 Source Server         : mecanisoft
 Source Server Type    : MySQL
 Source Server Version : 100512
 Source Host           : 156.67.74.151:3306
 Source Schema         : db_mecanisoft

 Target Server Type    : MySQL
 Target Server Version : 100512
 File Encoding         : 65001

 Date: 29/11/2021 17:18:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acceso
-- ----------------------------
DROP TABLE IF EXISTS `acceso`;
CREATE TABLE `acceso`  (
  `modulo_codigo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario_id` int NOT NULL,
  `acceso_estado` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`modulo_codigo`, `usuario_id`) USING BTREE,
  INDEX `fk_usuario`(`usuario_id`) USING BTREE,
  CONSTRAINT `fk_modulo` FOREIGN KEY (`modulo_codigo`) REFERENCES `modulo` (`modulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceso
-- ----------------------------
INSERT INTO `acceso` VALUES ('1', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1', 36, 'INACTIVO');
INSERT INTO `acceso` VALUES ('1-1', 4, 'INACTIVO');
INSERT INTO `acceso` VALUES ('1-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1-1', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1-2', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('1-2', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-1', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-1', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-2', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-3', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-4', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-5', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-5', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('10-5', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-1', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-1', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-2', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-3', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-4', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-5', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-5', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('11-5', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-1', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-1', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-2', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-3', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-4', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-5', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('12-5', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-10', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-10', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-10', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-11', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-11', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-12', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-12', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-13', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-13', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-13', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-6', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-6', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-6', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-7', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-7', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-7', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-8', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-8', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-9', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('13-9', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-1', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-5', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-5', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-6', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('14-6', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('15', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('15', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('15-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('15-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('15-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('15-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('15-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('15-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16-1', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('16-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('17', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('17', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('17-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('17-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('17-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('17-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-5', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-5', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-6', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-6', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-7', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-7', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-8', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('18-8', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('19-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-4', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('2-4', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20-2', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('20-2', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('21', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('21', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('22', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('22', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('23', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('23', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24', 35, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24', 39, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24-1', 35, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24-2', 39, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('24-3', 39, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3-2', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('3-3', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4', 37, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4', 38, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-1', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-1', 37, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-1', 38, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-4', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-4', 37, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-5', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-5', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-5', 36, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-6', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('4-6', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('5-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('6', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('6', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('6-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('6-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('6-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('6-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('6-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('6-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('7', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('7', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('7-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('7-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('7-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('7-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('7-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('7-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('8', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('8', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('8-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('8-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('8-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('8-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('8-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('8-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-1', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-1', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-2', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-2', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-3', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-3', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-4', 4, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-4', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-4', 34, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-5', 5, 'ACTIVO');
INSERT INTO `acceso` VALUES ('9-5', 34, 'ACTIVO');

-- ----------------------------
-- Table structure for bitacora
-- ----------------------------
DROP TABLE IF EXISTS `bitacora`;
CREATE TABLE `bitacora`  (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `bitacora_accion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bitacora_fecha_hora` datetime NULL DEFAULT NULL,
  `bitacora_tabla` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_usuario` int NULL DEFAULT NULL,
  `bitacora_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ip_publica` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_bitacora`) USING BTREE,
  INDEX `fkey`(`id_usuario`) USING BTREE,
  CONSTRAINT `fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 683 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bitacora
-- ----------------------------
INSERT INTO `bitacora` VALUES (235, 'Registrar', '2021-11-25 03:23:00', 'usuario', 5, 'Se registro usuario', '::1');
INSERT INTO `bitacora` VALUES (236, 'Registrar', '2021-11-25 03:25:59', 'proveedor', 5, 'Se registro un nuevo proveedor', '::1');
INSERT INTO `bitacora` VALUES (253, 'Login', '2021-11-25 03:28:04', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (254, 'Registrar', '2021-11-25 03:28:45', 'proveedor', 5, 'Se registro un nuevo proveedor', '::1');
INSERT INTO `bitacora` VALUES (255, 'Registrar', '2021-11-25 03:30:52', 'proveedor', 5, 'Se registro un nuevo proveedor', '::1');
INSERT INTO `bitacora` VALUES (256, 'Registrar', '2021-11-25 03:32:50', 'usuario', 5, 'Se registro usuario', '::1');
INSERT INTO `bitacora` VALUES (257, 'Registrar', '2021-11-25 03:35:46', 'cliente', 5, 'Se registro un nuevo cliente(08052001569320)', '::1');
INSERT INTO `bitacora` VALUES (258, 'Registrar', '2021-11-25 03:37:04', 'cliente', 5, 'Se registro un nuevo cliente(080510023569)', '::1');
INSERT INTO `bitacora` VALUES (259, 'Login', '2021-11-25 03:41:27', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (260, 'Login', '2021-11-25 03:43:21', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (261, 'Eliminar', '2021-11-25 03:47:16', 'accesos', 34, 'Se elimino un acceso(1), en el usuario (34)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (262, 'Registrar', '2021-11-25 03:47:20', 'accesos', 34, 'Se registro un acceso(1), en el usuario (34)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (263, 'Editar', '2021-11-25 03:47:27', 'accesos', 34, 'Se edito un acceso(1), en el usuario (34)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (264, 'Editar', '2021-11-25 03:47:31', 'accesos', 34, 'Se edito un acceso(1), en el usuario (34)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (265, 'Registrar', '2021-11-25 03:51:20', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (266, 'Registrar', '2021-11-25 03:53:31', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (267, 'Registrar', '2021-11-25 03:59:59', 'cliente', 34, 'Se registro un nuevo cliente(1012198545203)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (268, 'Editar', '2021-11-25 04:02:15', 'servicio', 34, 'Se edito un servicio(29)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (269, 'Login', '2021-11-25 04:04:37', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (270, 'Registrar', '2021-11-25 04:07:28', 'venta', 5, 'Se registro una nueva venta(243)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (271, 'Registrar', '2021-11-25 04:11:51', 'vehiculo', 34, 'Se registro un nuevo vehiculo', '::1');
INSERT INTO `bitacora` VALUES (272, 'Login', '2021-11-25 04:11:58', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (273, 'Registrar', '2021-11-25 04:13:34', 'vehiculo', 34, 'Se registro un nuevo vehiculo', '::1');
INSERT INTO `bitacora` VALUES (274, 'Editar', '2021-11-25 04:13:48', 'vehiculo', 34, 'Se edito un  vehiculo(12)', '::1');
INSERT INTO `bitacora` VALUES (275, 'Editar', '2021-11-25 04:13:59', 'vehiculo', 34, 'Se edito un  vehiculo(12)', '::1');
INSERT INTO `bitacora` VALUES (276, 'Login', '2021-11-25 04:16:45', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (277, 'Login', '2021-11-25 04:20:56', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (278, 'Editar', '2021-11-25 04:36:26', 'servicio', 34, 'Se edito un servicio(29)', '::1');
INSERT INTO `bitacora` VALUES (279, 'Editar', '2021-11-25 04:36:33', 'servicio', 34, 'Se edito un servicio(29)', '::1');
INSERT INTO `bitacora` VALUES (280, 'Login', '2021-11-25 04:39:02', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (281, 'Editar', '2021-11-25 04:39:31', 'servicio', 34, 'Se edito un servicio(29)', '::1');
INSERT INTO `bitacora` VALUES (282, 'Registrar', '2021-11-25 05:05:00', 'servicio', 5, 'Se registro una  servicio', '170.231.52.142');
INSERT INTO `bitacora` VALUES (283, 'Editar', '2021-11-25 05:05:25', 'servicio', 5, 'Se edito un servicio(168)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (284, 'Registrar', '2021-11-25 05:05:51', 'servicio', 34, 'Se registro una  servicio', '::1');
INSERT INTO `bitacora` VALUES (285, 'Editar', '2021-11-25 05:06:14', 'servicio', 34, 'Se edito un servicio(170)', '::1');
INSERT INTO `bitacora` VALUES (286, 'Editar', '2021-11-25 05:09:37', 'servicio', 34, 'Se edito un servicio(170)', '::1');
INSERT INTO `bitacora` VALUES (287, 'Registrar', '2021-11-25 05:17:58', 'Producto', 34, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (288, 'Oferta', '2021-11-25 05:18:33', 'Producto', 34, 'Se registro una oferta(171)', '::1');
INSERT INTO `bitacora` VALUES (289, 'Editar', '2021-11-25 05:32:05', 'accesos', 34, 'Se edito un acceso(11-1), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (290, 'Login', '2021-11-25 05:32:14', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (291, 'Login', '2021-11-25 05:36:27', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (292, 'Editar', '2021-11-25 05:45:23', 'accesos', 34, 'Se edito un acceso(11-1), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (293, 'Login', '2021-11-25 05:45:35', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (294, 'Registrar', '2021-11-25 05:50:00', 'cotizacion', 34, 'Se registro una nueva cotizacion()', '::1');
INSERT INTO `bitacora` VALUES (295, 'Login', '2021-11-25 06:01:29', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (296, 'Registrar', '2021-11-25 06:06:49', 'Orden', 34, 'Se registro una nueva orden', '::1');
INSERT INTO `bitacora` VALUES (297, 'Editar', '2021-11-25 06:13:07', 'usuario', 5, 'Se edito password(5)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (298, 'Registrar', '2021-11-25 06:13:07', 'Orden', 34, 'Se registro una nueva orden', '::1');
INSERT INTO `bitacora` VALUES (299, 'Login', '2021-11-25 06:13:19', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (300, 'Registrar', '2021-11-25 06:13:44', 'tarea', 5, 'Se registro una tarea', '170.231.52.142');
INSERT INTO `bitacora` VALUES (301, 'Fecha', '2021-11-25 06:13:51', 'tarea', 5, 'Se cambio la fecha(83)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (302, 'Anular', '2021-11-25 06:14:41', 'Orden', 34, 'Se anulo una  orden(247)', '::1');
INSERT INTO `bitacora` VALUES (303, 'Editar', '2021-11-25 06:14:55', 'tarea', 5, 'Se edito una tarea(83)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (304, 'Editar', '2021-11-25 06:15:10', 'tarea', 5, 'Se edito una tarea(83)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (305, 'Registrar', '2021-11-25 06:15:29', 'tarea', 34, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (306, 'Registrar', '2021-11-25 06:15:29', 'tarea', 5, 'Se registro una tarea', '170.231.52.142');
INSERT INTO `bitacora` VALUES (307, 'Registrar', '2021-11-25 06:16:11', 'tarea', 5, 'Se registro una tarea', '170.231.52.142');
INSERT INTO `bitacora` VALUES (308, 'Registrar', '2021-11-25 06:16:13', 'tarea', 34, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (309, 'Registrar', '2021-11-25 06:16:47', 'tarea', 34, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (310, 'Fecha', '2021-11-25 06:16:58', 'tarea', 34, 'Se cambio la fecha(88)', '::1');
INSERT INTO `bitacora` VALUES (311, 'Fecha', '2021-11-25 06:17:06', 'tarea', 34, 'Se cambio la fecha(88)', '::1');
INSERT INTO `bitacora` VALUES (312, 'Registrar', '2021-11-25 06:17:56', 'tarea', 34, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (313, 'Fecha', '2021-11-25 06:18:23', 'tarea', 34, 'Se cambio la fecha(89)', '::1');
INSERT INTO `bitacora` VALUES (314, 'Editar', '2021-11-25 06:19:47', 'Orden', 34, 'Se edito una  orden(246)', '::1');
INSERT INTO `bitacora` VALUES (315, 'Login', '2021-11-25 06:29:01', '', 36, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (316, 'Registrar', '2021-11-25 06:33:11', 'vehiculo', 5, 'Se registro un nuevo vehiculo', '170.231.52.142');
INSERT INTO `bitacora` VALUES (317, 'Login', '2021-11-25 06:33:15', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (318, 'Registrar', '2021-11-25 06:34:08', 'accesos', 34, 'Se registro un acceso(4), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (319, 'Registrar', '2021-11-25 06:34:23', 'accesos', 34, 'Se registro un acceso(4-4), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (320, 'Registrar', '2021-11-25 06:34:35', 'Orden', 5, 'Se registro una nueva orden', '170.231.52.142');
INSERT INTO `bitacora` VALUES (321, 'Registrar', '2021-11-25 06:34:39', 'accesos', 34, 'Se registro un acceso(4-1), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (322, 'Registrar', '2021-11-25 06:34:50', 'accesos', 34, 'Se registro un acceso(4-5), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (323, 'Registrar', '2021-11-25 06:35:01', 'accesos', 34, 'Se registro un acceso(4-2), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (324, 'Registrar', '2021-11-25 06:35:15', 'tarea', 5, 'Se registro una tarea', '170.231.52.142');
INSERT INTO `bitacora` VALUES (325, 'Registrar', '2021-11-25 06:35:29', 'tarea', 5, 'Se registro una tarea', '170.231.52.142');
INSERT INTO `bitacora` VALUES (326, 'Login', '2021-11-25 06:35:31', '', 36, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (327, 'Fecha', '2021-11-25 06:35:34', 'tarea', 5, 'Se cambio la fecha(90)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (328, 'Registrar', '2021-11-25 06:35:43', 'tarea', 5, 'Se registro una tarea', '170.231.52.142');
INSERT INTO `bitacora` VALUES (329, 'Editar', '2021-11-25 06:36:15', 'tarea', 5, 'Se edito una tarea(91)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (330, 'Login', '2021-11-25 06:36:24', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (331, 'Eliminar', '2021-11-25 06:37:58', 'accesos', 34, 'Se elimino un acceso(4-4), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (332, 'Eliminar', '2021-11-25 06:38:25', 'accesos', 34, 'Se elimino un acceso(4-2), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (333, 'Login', '2021-11-25 06:38:37', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (334, 'Editar', '2021-11-25 06:39:46', 'Orden', 34, 'Se edito una  orden(246)', '::1');
INSERT INTO `bitacora` VALUES (335, 'Registrar', '2021-11-25 06:40:39', 'accesos', 5, 'Se registro un acceso(4), en el usuario (38)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (336, 'Registrar', '2021-11-25 06:40:49', 'accesos', 5, 'Se registro un acceso(4-1), en el usuario (38)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (337, 'Login', '2021-11-25 06:41:47', '', 38, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (338, 'Fecha', '2021-11-25 06:42:17', 'tarea', 34, 'Se cambio la fecha(89)', '::1');
INSERT INTO `bitacora` VALUES (339, 'Fecha', '2021-11-25 06:42:27', 'tarea', 34, 'Se cambio la fecha(89)', '::1');
INSERT INTO `bitacora` VALUES (340, 'Fecha', '2021-11-25 06:42:31', 'tarea', 34, 'Se cambio la fecha(89)', '::1');
INSERT INTO `bitacora` VALUES (341, 'Fecha', '2021-11-25 06:42:37', 'tarea', 34, 'Se cambio la fecha(89)', '::1');
INSERT INTO `bitacora` VALUES (342, 'Editar', '2021-11-25 06:46:54', 'tarea', 34, 'Se edito una tarea(89)', '::1');
INSERT INTO `bitacora` VALUES (343, 'Editar', '2021-11-25 06:48:40', 'Orden', 34, 'Se edito una  orden(246)', '::1');
INSERT INTO `bitacora` VALUES (344, 'Anular', '2021-11-25 06:49:21', 'Orden', 34, 'Se anulo una  orden(246)', '::1');
INSERT INTO `bitacora` VALUES (345, 'Fecha', '2021-11-25 06:54:08', 'tarea', 34, 'Se cambio la fecha(90)', '::1');
INSERT INTO `bitacora` VALUES (346, 'Registrar', '2021-11-25 06:55:54', 'Orden', 34, 'Se registro una nueva orden', '::1');
INSERT INTO `bitacora` VALUES (347, 'Registrar', '2021-11-25 06:56:25', 'tarea', 34, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (348, 'Editar', '2021-11-25 06:56:33', 'tarea', 34, 'Se edito una tarea(95)', '::1');
INSERT INTO `bitacora` VALUES (349, 'Facturar', '2021-11-25 06:57:01', 'Orden', 34, 'Se facturo una  orden(249)', '::1');
INSERT INTO `bitacora` VALUES (350, 'Registrar', '2021-11-25 07:44:29', 'tarea', 5, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (351, 'Editar', '2021-11-25 07:50:05', 'tarea', 5, 'Se edito una tarea(93)', '::1');
INSERT INTO `bitacora` VALUES (352, 'Editar', '2021-11-25 07:51:29', 'tarea', 5, 'Se edito una tarea(93)', '::1');
INSERT INTO `bitacora` VALUES (353, 'Fecha', '2021-11-25 07:51:58', 'tarea', 5, 'Se cambio la fecha(93)', '::1');
INSERT INTO `bitacora` VALUES (354, 'Login', '2021-11-25 07:52:33', '', 36, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (355, 'Login', '2021-11-25 07:53:09', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (356, 'Registrar', '2021-11-25 07:53:44', 'accesos', 5, 'Se registro un acceso(4-4), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (357, 'Login', '2021-11-25 07:53:58', '', 36, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (358, 'Editar', '2021-11-25 07:54:27', 'tarea', 36, 'Se edito una tarea(93)', '::1');
INSERT INTO `bitacora` VALUES (359, 'Login', '2021-11-25 07:55:46', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (360, 'Login', '2021-11-25 07:58:33', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (361, 'Login', '2021-11-25 07:59:22', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (362, 'Registrar', '2021-11-25 07:59:40', 'accesos', 5, 'Se registro un acceso(21), en el usuario (5)', '::1');
INSERT INTO `bitacora` VALUES (363, 'Registrar', '2021-11-25 07:59:41', 'accesos', 5, 'Se registro un acceso(22), en el usuario (5)', '::1');
INSERT INTO `bitacora` VALUES (364, 'Login', '2021-11-25 07:59:58', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (365, 'Login', '2021-11-25 08:03:47', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (366, 'Login', '2021-11-25 16:26:26', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (367, 'Registrar', '2021-11-25 16:34:42', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (368, 'Registrar', '2021-11-25 16:35:35', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (369, 'Registrar', '2021-11-25 16:36:29', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (370, 'Registrar', '2021-11-25 16:37:17', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (371, 'Registrar', '2021-11-25 16:37:59', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (372, 'Registrar', '2021-11-25 16:40:32', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (373, 'Login', '2021-11-25 17:02:11', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (374, 'Login', '2021-11-25 18:58:20', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (375, 'Registrar', '2021-11-25 19:08:48', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (376, 'Registrar', '2021-11-25 19:09:19', 'Producto', 5, 'Se registro un Producto', '170.231.52.142');
INSERT INTO `bitacora` VALUES (377, 'Registrar', '2021-11-25 19:18:40', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (378, 'Registrar', '2021-11-25 19:26:34', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (379, 'Editar', '2021-11-25 19:27:34', 'Producto', 5, 'Se edito un Producto(182)', '::1');
INSERT INTO `bitacora` VALUES (380, 'Registrar', '2021-11-25 19:29:23', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (381, 'Registrar', '2021-11-25 19:30:36', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (382, 'Registrar', '2021-11-25 19:32:29', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (383, 'Registrar', '2021-11-25 19:34:18', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (384, 'Registrar', '2021-11-25 19:35:09', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (385, 'Registrar', '2021-11-25 19:36:05', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (386, 'Registrar', '2021-11-25 19:40:25', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (387, 'Registrar', '2021-11-25 19:43:02', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (388, 'Registrar', '2021-11-25 19:46:11', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (389, 'Registrar', '2021-11-25 19:47:21', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (390, 'Registrar', '2021-11-25 19:50:53', 'servicio', 5, 'Se registro una  servicio', '::1');
INSERT INTO `bitacora` VALUES (391, 'Registrar', '2021-11-25 19:52:42', 'servicio', 5, 'Se registro una  servicio', '::1');
INSERT INTO `bitacora` VALUES (392, 'Registrar', '2021-11-25 19:56:04', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (393, 'Registrar', '2021-11-25 19:57:24', 'Producto', 5, 'Se registro un Producto', '::1');
INSERT INTO `bitacora` VALUES (394, 'Registrar', '2021-11-25 20:08:51', 'venta', 5, 'Se registro una nueva venta(253)', '::1');
INSERT INTO `bitacora` VALUES (395, 'Editar', '2021-11-25 20:23:35', 'movimiento', 5, 'Se edito un  movimiento(256)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (396, 'Anular', '2021-11-25 20:24:55', 'movimiento', 5, 'Se anulo un  movimiento(256)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (397, 'Editar', '2021-11-25 20:28:16', 'movimiento', 5, 'Se edito un  movimiento(257)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (398, 'Anular', '2021-11-25 20:29:15', 'movimiento', 5, 'Se anulo un  movimiento(257)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (399, 'Registrar', '2021-11-25 20:40:09', 'venta', 5, 'Se registro una nueva venta(259)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (400, 'Registrar', '2021-11-25 20:51:11', 'venta', 5, 'Se registro una nueva venta(262)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (401, 'Registrar', '2021-11-25 20:52:27', 'venta', 5, 'Se registro una nueva venta(263)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (402, 'Registrar', '2021-11-25 20:52:55', 'venta', 5, 'Se registro una nueva venta(264)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (403, 'Registrar', '2021-11-25 20:53:14', 'venta', 5, 'Se registro una nueva venta(265)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (404, 'Registrar', '2021-11-25 20:57:08', 'vehiculo', 5, 'Se registro un nuevo vehiculo', '170.231.52.142');
INSERT INTO `bitacora` VALUES (405, 'Editar', '2021-11-25 20:57:39', 'vehiculo', 5, 'Se edito un  vehiculo(14)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (406, 'Registrar', '2021-11-25 20:59:02', 'Orden', 5, 'Se registro una nueva orden', '170.231.52.142');
INSERT INTO `bitacora` VALUES (407, 'Editar', '2021-11-25 20:59:38', 'cotizacion', 5, 'Se edito una cotizacion(245)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (408, 'Registrar', '2021-11-25 21:03:26', 'tarea', 5, 'Se registro una tarea', '170.231.52.142');
INSERT INTO `bitacora` VALUES (409, 'Editar', '2021-11-25 21:04:15', 'tarea', 5, 'Se edito una tarea(97)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (410, 'Editar', '2021-11-25 21:05:24', 'tarea', 5, 'Se edito una tarea(97)', '::1');
INSERT INTO `bitacora` VALUES (411, 'Registrar', '2021-11-25 21:05:50', 'tarea', 5, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (412, 'Fecha', '2021-11-25 21:06:49', 'tarea', 5, 'Se cambio la fecha(99)', '::1');
INSERT INTO `bitacora` VALUES (413, 'Registrar', '2021-11-25 21:07:16', 'tarea', 5, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (414, 'Registrar', '2021-11-25 21:07:52', 'tarea', 5, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (415, 'Editar', '2021-11-25 21:08:15', 'tarea', 5, 'Se edito una tarea(101)', '::1');
INSERT INTO `bitacora` VALUES (416, 'Fecha', '2021-11-25 21:08:27', 'tarea', 5, 'Se cambio la fecha(101)', '::1');
INSERT INTO `bitacora` VALUES (417, 'Login', '2021-11-25 21:09:58', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (418, 'Login', '2021-11-25 21:11:43', '', 37, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (419, 'Login', '2021-11-25 21:12:12', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (420, 'Registrar', '2021-11-25 21:12:57', 'accesos', 5, 'Se registro un acceso(4), en el usuario (37)', '::1');
INSERT INTO `bitacora` VALUES (421, 'Registrar', '2021-11-25 21:12:58', 'accesos', 5, 'Se registro un acceso(4-1), en el usuario (37)', '::1');
INSERT INTO `bitacora` VALUES (422, 'Registrar', '2021-11-25 21:13:12', 'accesos', 5, 'Se registro un acceso(4-4), en el usuario (37)', '::1');
INSERT INTO `bitacora` VALUES (423, 'Login', '2021-11-25 21:13:30', '', 37, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (424, 'Login', '2021-11-25 21:14:31', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (425, 'Registrar', '2021-11-25 21:16:04', 'cliente', 5, 'Se registro un nuevo cliente(080520014899)', '::1');
INSERT INTO `bitacora` VALUES (426, 'Editar', '2021-11-25 21:16:30', 'cliente', 5, 'Se edito un  cliente(08052001569320)', '::1');
INSERT INTO `bitacora` VALUES (427, 'Editar', '2021-11-25 21:16:54', 'cliente', 5, 'Se edito un  cliente(080510023569)', '::1');
INSERT INTO `bitacora` VALUES (428, 'Registrar', '2021-11-25 21:17:50', 'vehiculo', 5, 'Se registro un nuevo vehiculo', '::1');
INSERT INTO `bitacora` VALUES (429, 'Registrar', '2021-11-25 21:19:16', 'Orden', 5, 'Se registro una nueva orden', '::1');
INSERT INTO `bitacora` VALUES (430, 'Registrar', '2021-11-25 21:19:47', 'tarea', 5, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (431, 'Fecha', '2021-11-25 21:20:10', 'tarea', 5, 'Se cambio la fecha(96)', '::1');
INSERT INTO `bitacora` VALUES (432, 'Fecha', '2021-11-25 21:20:18', 'tarea', 5, 'Se cambio la fecha(96)', '::1');
INSERT INTO `bitacora` VALUES (433, 'Fecha', '2021-11-25 21:20:36', 'tarea', 5, 'Se cambio la fecha(98)', '::1');
INSERT INTO `bitacora` VALUES (434, 'Fecha', '2021-11-25 21:20:43', 'tarea', 5, 'Se cambio la fecha(98)', '::1');
INSERT INTO `bitacora` VALUES (435, 'Fecha', '2021-11-25 21:20:50', 'tarea', 5, 'Se cambio la fecha(103)', '::1');
INSERT INTO `bitacora` VALUES (436, 'Fecha', '2021-11-25 21:20:56', 'tarea', 5, 'Se cambio la fecha(103)', '::1');
INSERT INTO `bitacora` VALUES (437, 'Login', '2021-11-25 21:40:40', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (438, 'Login', '2021-11-25 21:49:07', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (439, 'Login', '2021-11-25 21:49:10', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (440, 'Login', '2021-11-25 21:56:05', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (441, 'Login', '2021-11-25 22:14:30', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (442, 'Login', '2021-11-25 22:16:52', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (443, 'Login', '2021-11-25 22:20:07', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (444, 'Login', '2021-11-25 22:20:10', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (445, 'Login', '2021-11-25 22:22:09', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (446, 'Login', '2021-11-25 22:25:22', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (447, 'Login', '2021-11-25 22:26:23', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (448, 'Login', '2021-11-25 22:26:24', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (449, 'Registrar', '2021-11-25 22:43:15', 'cliente', 5, 'Se registro un nuevo cliente(080320000020)', '::1');
INSERT INTO `bitacora` VALUES (450, 'Registrar', '2021-11-25 22:44:27', 'vehiculo', 5, 'Se registro un nuevo vehiculo', '::1');
INSERT INTO `bitacora` VALUES (451, 'Registrar', '2021-11-25 22:46:38', 'Orden', 5, 'Se registro una nueva orden', '::1');
INSERT INTO `bitacora` VALUES (452, 'Registrar', '2021-11-25 22:49:29', 'accesos', 34, 'Se registro un acceso(21), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (453, 'Registrar', '2021-11-25 22:49:34', 'accesos', 34, 'Se registro un acceso(22), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (454, 'Login', '2021-11-25 22:49:49', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (455, 'Login', '2021-11-25 22:52:23', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (456, 'Login', '2021-11-25 22:56:38', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (457, 'Login', '2021-11-25 23:05:43', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (458, 'Login', '2021-11-26 00:02:32', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (459, 'Login', '2021-11-26 00:12:36', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (460, 'Login', '2021-11-26 00:13:27', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (461, 'Login', '2021-11-26 00:16:02', '', 5, 'El usuario inicio sesion', '181.189.246.97');
INSERT INTO `bitacora` VALUES (462, 'Registrar', '2021-11-26 00:20:52', 'Producto', 5, 'Se registro un Producto', '181.189.246.97');
INSERT INTO `bitacora` VALUES (463, 'Editar', '2021-11-26 00:21:07', 'Producto', 5, 'Se edito un Producto(197)', '181.189.246.97');
INSERT INTO `bitacora` VALUES (464, 'Registrar', '2021-11-26 00:22:39', 'servicio', 5, 'Se registro una  servicio', '181.189.246.97');
INSERT INTO `bitacora` VALUES (465, 'Editar', '2021-11-26 00:23:10', 'servicio', 5, 'Se edito un servicio(198)', '181.189.246.97');
INSERT INTO `bitacora` VALUES (466, 'Login', '2021-11-26 00:30:30', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (467, 'Login', '2021-11-26 00:41:40', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (468, 'Registrar', '2021-11-26 00:48:49', 'Producto', 5, 'Se registro un Producto', '181.189.246.97');
INSERT INTO `bitacora` VALUES (469, 'Editar', '2021-11-26 00:50:17', 'Producto', 5, 'Se edito un Producto(199)', '181.189.246.97');
INSERT INTO `bitacora` VALUES (470, 'Oferta', '2021-11-26 00:50:56', 'Producto', 5, 'Se registro una oferta(199)', '181.189.246.97');
INSERT INTO `bitacora` VALUES (471, 'Login', '2021-11-26 00:57:09', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (472, 'Registrar', '2021-11-26 00:57:59', 'accesos', 34, 'Se registro un acceso(1), en el usuario (36)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (473, 'Editar', '2021-11-26 00:58:07', 'accesos', 34, 'Se edito un acceso(1), en el usuario (36)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (474, 'Registrar', '2021-11-26 01:01:14', 'cotizacion', 34, 'Se registro una nueva cotizacion()', '190.11.236.251');
INSERT INTO `bitacora` VALUES (475, 'Registrar', '2021-11-26 01:05:14', 'tarea', 34, 'Se registro una tarea', '190.11.236.251');
INSERT INTO `bitacora` VALUES (476, 'Fecha', '2021-11-26 01:05:19', 'tarea', 34, 'Se cambio la fecha(104)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (477, 'Fecha', '2021-11-26 01:05:25', 'tarea', 34, 'Se cambio la fecha(104)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (478, 'Login', '2021-11-26 01:06:15', '', 36, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (479, 'Editar', '2021-11-26 01:06:36', 'tarea', 36, 'Se edito una tarea(99)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (480, 'Login', '2021-11-26 01:07:18', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (481, 'Login', '2021-11-26 01:11:34', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (482, 'Registrar', '2021-11-26 01:13:11', 'venta', 5, 'Se registro una nueva venta(273)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (483, 'Login', '2021-11-26 01:56:06', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (484, 'Login', '2021-11-26 01:56:17', '', 34, 'El usuario inicio sesion', '2600:1700:2050:c210:4c92:18d7:e7a9:4059');
INSERT INTO `bitacora` VALUES (485, 'Login', '2021-11-26 23:26:03', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (486, 'Login', '2021-11-26 23:26:06', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (487, 'Login', '2021-11-26 23:34:16', '', 5, 'El usuario inicio sesion', '181.189.246.97');
INSERT INTO `bitacora` VALUES (488, 'Login', '2021-11-27 02:15:57', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (489, 'Registrar', '2021-11-27 02:32:55', 'cotizacion', 34, 'Se registro una nueva cotizacion()', '::1');
INSERT INTO `bitacora` VALUES (490, 'Login', '2021-11-27 02:34:59', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (491, 'Login', '2021-11-27 02:49:56', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (492, 'Registrar', '2021-11-27 03:09:39', 'accesos', 5, 'Se registro un acceso(1-1), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (493, 'Registrar', '2021-11-27 03:11:35', 'accesos', 5, 'Se registro un acceso(3-1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (494, 'Registrar', '2021-11-27 07:21:52', 'accesos', 5, 'Se registro un acceso(11-4), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (495, 'Registrar', '2021-11-27 07:24:27', 'accesos', 5, 'Se registro un acceso(1-2), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (496, 'Registrar', '2021-11-27 07:26:15', 'accesos', 5, 'Se registro un acceso(10), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (497, 'Registrar', '2021-11-27 07:29:22', 'accesos', 5, 'Se registro un acceso(1), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (498, 'Registrar', '2021-11-27 07:29:22', 'accesos', 5, 'Se registro un acceso(1-2), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (499, 'Registrar', '2021-11-27 07:29:22', 'accesos', 5, 'Se registro un acceso(10-5), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (500, 'Registrar', '2021-11-27 07:29:22', 'accesos', 5, 'Se registro un acceso(3-2), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (501, 'Registrar', '2021-11-27 07:30:24', 'accesos', 5, 'Se registro un acceso(13-13), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (502, 'Registrar', '2021-11-27 07:30:24', 'accesos', 5, 'Se registro un acceso(13-6), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (503, 'Registrar', '2021-11-27 07:30:24', 'accesos', 5, 'Se registro un acceso(13-7), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (504, 'Registrar', '2021-11-27 07:32:57', 'accesos', 5, 'Se registro un acceso(10), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (505, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(10-1), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (506, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(10-2), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (507, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(10-3), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (508, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(10-4), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (509, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(11), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (510, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(11-1), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (511, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(11-2), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (512, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(11-3), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (513, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(11-4), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (514, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(11-5), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (515, 'Registrar', '2021-11-27 07:32:58', 'accesos', 5, 'Se registro un acceso(12), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (516, 'Registrar', '2021-11-27 07:32:59', 'accesos', 5, 'Se registro un acceso(12-1), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (517, 'Registrar', '2021-11-27 07:32:59', 'accesos', 5, 'Se registro un acceso(12-2), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (518, 'Registrar', '2021-11-27 07:32:59', 'accesos', 5, 'Se registro un acceso(12-3), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (519, 'Registrar', '2021-11-27 07:33:36', 'accesos', 5, 'Se registro un acceso(2), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (520, 'Registrar', '2021-11-27 07:33:36', 'accesos', 5, 'Se registro un acceso(2-4), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (521, 'Login', '2021-11-27 07:34:21', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (522, 'Registrar', '2021-11-27 07:35:04', 'accesos', 5, 'Se registro un acceso(2), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (523, 'Registrar', '2021-11-27 07:35:04', 'accesos', 5, 'Se registro un acceso(2-4), en el usuario (36)', '::1');
INSERT INTO `bitacora` VALUES (524, 'Login', '2021-11-27 07:35:19', '', 36, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (525, 'Login', '2021-11-27 07:36:37', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (526, 'Registrar', '2021-11-27 07:49:08', 'accesos', 5, 'Se registro un acceso(16-1), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (527, 'Registrar', '2021-11-27 07:49:34', 'accesos', 5, 'Se registro un acceso(13-10), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (528, 'Registrar', '2021-11-27 07:49:34', 'accesos', 5, 'Se registro un acceso(9-4), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (529, 'Registrar', '2021-11-27 07:52:38', 'accesos', 5, 'Se registro un acceso(16), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (530, 'Registrar', '2021-11-27 07:52:38', 'accesos', 5, 'Se registro un acceso(20), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (531, 'Registrar', '2021-11-27 07:53:09', 'accesos', 5, 'Se registro un acceso(12-4), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (532, 'Registrar', '2021-11-27 07:53:09', 'accesos', 5, 'Se registro un acceso(14-1), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (533, 'Registrar', '2021-11-27 07:53:09', 'accesos', 5, 'Se registro un acceso(20-2), en el usuario (4)', '::1');
INSERT INTO `bitacora` VALUES (534, 'Login', '2021-11-27 07:53:28', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (535, 'Eliminar', '2021-11-27 07:53:49', 'accesos', 5, 'Se elimino un acceso(1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (536, 'Eliminar', '2021-11-27 07:54:05', 'accesos', 5, 'Se elimino un acceso(3-3), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (537, 'Eliminar', '2021-11-27 07:54:13', 'accesos', 5, 'Se elimino un acceso(3-1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (538, 'Eliminar', '2021-11-27 07:54:17', 'accesos', 5, 'Se elimino un acceso(20-1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (539, 'Eliminar', '2021-11-27 07:54:22', 'accesos', 5, 'Se elimino un acceso(20), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (540, 'Eliminar', '2021-11-27 07:54:25', 'accesos', 5, 'Se elimino un acceso(19), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (541, 'Eliminar', '2021-11-27 07:54:29', 'accesos', 5, 'Se elimino un acceso(13-12), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (542, 'Eliminar', '2021-11-27 07:54:34', 'accesos', 5, 'Se elimino un acceso(12-5), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (543, 'Eliminar', '2021-11-27 07:54:43', 'accesos', 5, 'Se elimino un acceso(11-1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (544, 'Eliminar', '2021-11-27 07:54:47', 'accesos', 5, 'Se elimino un acceso(11-3), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (545, 'Eliminar', '2021-11-27 07:55:00', 'accesos', 5, 'Se elimino un acceso(10-5), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (546, 'Eliminar', '2021-11-27 07:55:03', 'accesos', 5, 'Se elimino un acceso(11-4), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (547, 'Eliminar', '2021-11-27 07:55:07', 'accesos', 5, 'Se elimino un acceso(11-2), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (548, 'Login', '2021-11-27 16:26:56', '', 5, 'El usuario inicio sesion', '181.189.246.97');
INSERT INTO `bitacora` VALUES (549, 'Login', '2021-11-27 16:27:40', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (550, 'Registrar', '2021-11-27 16:28:22', 'accesos', 34, 'Se registro un acceso(1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (551, 'Registrar', '2021-11-27 16:28:22', 'accesos', 34, 'Se registro un acceso(1-1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (552, 'Registrar', '2021-11-27 16:28:22', 'accesos', 34, 'Se registro un acceso(1-2), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (553, 'Registrar', '2021-11-27 16:28:22', 'accesos', 34, 'Se registro un acceso(10), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (554, 'Registrar', '2021-11-27 16:28:22', 'accesos', 34, 'Se registro un acceso(10-1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (555, 'Registrar', '2021-11-27 16:28:23', 'accesos', 34, 'Se registro un acceso(10-2), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (556, 'Registrar', '2021-11-27 16:28:23', 'accesos', 34, 'Se registro un acceso(10-3), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (557, 'Registrar', '2021-11-27 16:28:23', 'accesos', 34, 'Se registro un acceso(10-4), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (558, 'Eliminar', '2021-11-27 16:28:29', 'accesos', 34, 'Se elimino un acceso(1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (559, 'Eliminar', '2021-11-27 16:28:32', 'accesos', 34, 'Se elimino un acceso(1-1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (560, 'Eliminar', '2021-11-27 16:28:37', 'accesos', 34, 'Se elimino un acceso(1-2), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (561, 'Eliminar', '2021-11-27 16:28:43', 'accesos', 34, 'Se elimino un acceso(10), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (562, 'Eliminar', '2021-11-27 16:28:46', 'accesos', 34, 'Se elimino un acceso(10-1), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (563, 'Eliminar', '2021-11-27 16:28:50', 'accesos', 34, 'Se elimino un acceso(10-2), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (564, 'Eliminar', '2021-11-27 16:28:53', 'accesos', 34, 'Se elimino un acceso(10-3), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (565, 'Eliminar', '2021-11-27 16:28:59', 'accesos', 34, 'Se elimino un acceso(10-4), en el usuario (35)', '::1');
INSERT INTO `bitacora` VALUES (566, 'Registrar', '2021-11-27 16:35:55', 'accesos', 34, 'Se registro un acceso(23), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (567, 'Login', '2021-11-27 16:36:07', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (568, 'Login', '2021-11-27 16:38:37', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (569, 'Login', '2021-11-27 16:38:41', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (570, 'Editar', '2021-11-27 17:21:00', 'Producto', 5, 'Se edito un Producto(172)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (571, 'Login', '2021-11-27 17:25:04', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (572, 'Login', '2021-11-27 17:26:27', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (573, 'Login', '2021-11-27 17:28:21', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (574, 'Login', '2021-11-27 17:28:24', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (575, 'Login', '2021-11-27 17:28:28', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (576, 'Registrar', '2021-11-27 17:28:58', 'accesos', 5, 'Se registro un acceso(23), en el usuario (5)', '::1');
INSERT INTO `bitacora` VALUES (577, 'Registrar', '2021-11-27 17:28:58', 'accesos', 5, 'Se registro un acceso(24), en el usuario (5)', '::1');
INSERT INTO `bitacora` VALUES (578, 'Registrar', '2021-11-27 17:28:58', 'accesos', 5, 'Se registro un acceso(24-1), en el usuario (5)', '::1');
INSERT INTO `bitacora` VALUES (579, 'Registrar', '2021-11-27 17:28:58', 'accesos', 5, 'Se registro un acceso(24-2), en el usuario (5)', '::1');
INSERT INTO `bitacora` VALUES (580, 'Login', '2021-11-27 17:29:12', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (581, 'Login', '2021-11-27 21:15:41', '', 5, 'El usuario inicio sesion', '181.189.246.97');
INSERT INTO `bitacora` VALUES (582, 'Login', '2021-11-28 22:43:56', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (583, 'Login', '2021-11-28 22:43:57', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (584, 'Login', '2021-11-28 22:44:01', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (585, 'Editar', '2021-11-28 22:45:26', 'Producto', 5, 'Se edito un Producto(148)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (586, 'Editar', '2021-11-28 22:56:46', 'Producto', 5, 'Se edito un Producto(148)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (587, 'Editar', '2021-11-28 23:05:48', 'servicio', 5, 'Se edito un servicio(29)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (588, 'Editar', '2021-11-28 23:06:12', 'servicio', 5, 'Se edito un servicio(29)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (589, 'Login', '2021-11-28 23:18:31', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (590, 'Registrar', '2021-11-28 23:20:14', 'usuario', 5, 'Se registro usuario', '127.0.0.1');
INSERT INTO `bitacora` VALUES (591, 'Login', '2021-11-29 01:25:00', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (592, 'Login', '2021-11-29 01:27:51', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (593, 'Login', '2021-11-29 01:29:57', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (594, 'Login', '2021-11-29 02:18:26', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (595, 'Login', '2021-11-29 02:56:50', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (596, 'Login', '2021-11-29 03:00:26', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (597, 'Registrar', '2021-11-29 03:01:10', 'accesos', 34, 'Se registro un acceso(24), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (598, 'Registrar', '2021-11-29 03:01:10', 'accesos', 34, 'Se registro un acceso(24-1), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (599, 'Registrar', '2021-11-29 03:01:11', 'accesos', 34, 'Se registro un acceso(24-2), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (600, 'Registrar', '2021-11-29 03:01:11', 'accesos', 34, 'Se registro un acceso(24-3), en el usuario (34)', '::1');
INSERT INTO `bitacora` VALUES (601, 'Login', '2021-11-29 03:01:18', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (602, 'Login', '2021-11-29 03:04:38', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (603, 'Eliminar', '2021-11-29 03:12:04', 'accesos', 5, 'Se elimino un acceso(24), en el usuario (39)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (604, 'Eliminar', '2021-11-29 03:12:09', 'accesos', 5, 'Se elimino un acceso(24-1), en el usuario (39)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (605, 'Eliminar', '2021-11-29 03:12:15', 'accesos', 5, 'Se elimino un acceso(24-2), en el usuario (39)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (606, 'Login', '2021-11-29 03:15:34', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (607, 'Login', '2021-11-29 03:15:36', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (608, 'Login', '2021-11-29 03:16:38', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (609, 'Login', '2021-11-29 03:16:42', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (610, 'Login', '2021-11-29 03:17:49', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (611, 'Login', '2021-11-29 03:19:14', '', 39, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (612, 'Login', '2021-11-29 03:19:17', '', 39, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (613, 'Login', '2021-11-29 03:19:50', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (614, 'Registrar', '2021-11-29 03:22:24', 'accesos', 5, 'Se registro un acceso(24), en el usuario (39)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (615, 'Login', '2021-11-29 03:22:51', '', 39, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (616, 'Registrar', '2021-11-29 03:24:01', 'accesos', 34, 'Se registro un acceso(24-2), en el usuario (39)', '::1');
INSERT INTO `bitacora` VALUES (617, 'Registrar', '2021-11-29 03:24:01', 'accesos', 34, 'Se registro un acceso(24-3), en el usuario (39)', '::1');
INSERT INTO `bitacora` VALUES (618, 'Login', '2021-11-29 03:24:17', '', 39, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (619, 'Login', '2021-11-29 03:24:20', '', 39, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (620, 'Login', '2021-11-29 03:25:11', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (621, 'Login', '2021-11-29 03:28:44', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (622, 'Login', '2021-11-29 03:38:29', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (623, 'Registrar', '2021-11-29 03:39:40', 'cotizacion', 34, 'Se registro una nueva cotizacion()', '::1');
INSERT INTO `bitacora` VALUES (624, 'Registrar', '2021-11-29 03:40:59', 'Orden', 34, 'Se registro una nueva orden', '::1');
INSERT INTO `bitacora` VALUES (625, 'Registrar', '2021-11-29 03:41:51', 'tarea', 34, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (626, 'Editar', '2021-11-29 03:42:02', 'tarea', 34, 'Se edito una tarea(106)', '::1');
INSERT INTO `bitacora` VALUES (627, 'Editar', '2021-11-29 03:42:10', 'tarea', 34, 'Se edito una tarea(105)', '::1');
INSERT INTO `bitacora` VALUES (628, 'Facturar', '2021-11-29 03:43:12', 'Orden', 34, 'Se facturo una  orden(276)', '::1');
INSERT INTO `bitacora` VALUES (629, 'Login', '2021-11-29 13:01:19', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (630, 'Editar', '2021-11-29 13:26:16', 'proveedor', 5, 'Se edito  un  proveedor(10)', '::1');
INSERT INTO `bitacora` VALUES (631, 'Editar', '2021-11-29 13:26:21', 'proveedor', 5, 'Se edito  un  proveedor(10)', '::1');
INSERT INTO `bitacora` VALUES (632, 'Editar', '2021-11-29 13:26:39', 'proveedor', 5, 'Se edito  un  proveedor(10)', '::1');
INSERT INTO `bitacora` VALUES (633, 'Registrar', '2021-11-29 13:28:03', 'proveedor', 5, 'Se registro un nuevo proveedor', '::1');
INSERT INTO `bitacora` VALUES (634, 'Editar', '2021-11-29 13:28:16', 'proveedor', 5, 'Se edito  un  proveedor(13)', '::1');
INSERT INTO `bitacora` VALUES (635, 'Registrar', '2021-11-29 13:31:22', 'proveedor', 5, 'Se registro un nuevo proveedor', '::1');
INSERT INTO `bitacora` VALUES (636, 'Editar', '2021-11-29 13:31:53', 'proveedor', 5, 'Se edito  un  proveedor(11)', '::1');
INSERT INTO `bitacora` VALUES (637, 'Registrar', '2021-11-29 13:41:57', 'cliente', 5, 'Se registro un nuevo cliente(08011999000256)', '::1');
INSERT INTO `bitacora` VALUES (638, 'Registrar', '2021-11-29 13:43:18', 'cliente', 5, 'Se registro un nuevo cliente(080520001000656)', '::1');
INSERT INTO `bitacora` VALUES (639, 'Registrar', '2021-11-29 13:45:04', 'venta', 5, 'Se registro una nueva venta(279)', '::1');
INSERT INTO `bitacora` VALUES (640, 'Registrar', '2021-11-29 13:46:17', 'tarea', 5, 'Se registro una tarea', '::1');
INSERT INTO `bitacora` VALUES (641, 'Fecha', '2021-11-29 13:46:23', 'tarea', 5, 'Se cambio la fecha(107)', '::1');
INSERT INTO `bitacora` VALUES (642, 'Registrar', '2021-11-29 13:46:52', 'servicio', 5, 'Se registro una  servicio', '::1');
INSERT INTO `bitacora` VALUES (643, 'Login', '2021-11-29 17:47:11', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (644, 'Login', '2021-11-29 17:47:11', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (645, 'Login', '2021-11-29 17:49:38', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (646, 'Eliminar', '2021-11-29 17:50:32', 'accesos', 34, 'Se elimino un acceso(24), en el usuario (34)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (647, 'Login', '2021-11-29 19:09:50', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (648, 'Login', '2021-11-29 19:09:53', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (649, 'Login', '2021-11-29 20:48:08', '', 5, 'El usuario inicio sesion', '127.0.0.1');
INSERT INTO `bitacora` VALUES (650, 'Login', '2021-11-29 20:53:21', '', 5, 'El usuario inicio sesion', '181.189.246.97');
INSERT INTO `bitacora` VALUES (651, 'Editar', '2021-11-29 20:53:52', 'servicio', 5, 'Se edito un servicio(29)', '181.189.246.97');
INSERT INTO `bitacora` VALUES (652, 'Editar', '2021-11-29 20:57:13', 'servicio', 5, 'Se edito un servicio(29)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (653, 'Registrar', '2021-11-29 20:58:50', 'servicio', 5, 'Se registro una  servicio', '127.0.0.1');
INSERT INTO `bitacora` VALUES (654, 'Login', '2021-11-29 20:59:50', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (655, 'Editar', '2021-11-29 21:00:43', 'Producto', 5, 'Se edito un Producto(148)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (656, 'Editar', '2021-11-29 21:01:05', 'Producto', 5, 'Se edito un Producto(148)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (657, 'Editar', '2021-11-29 21:01:07', 'Producto', 5, 'Se edito un Producto(148)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (658, 'Login', '2021-11-29 21:01:32', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (659, 'Editar', '2021-11-29 21:03:57', 'Producto', 5, 'Se edito un Producto(148)', '127.0.0.1');
INSERT INTO `bitacora` VALUES (660, 'Editar', '2021-11-29 21:04:22', 'servicio', 34, 'Se edito un servicio(29)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (661, 'Login', '2021-11-29 21:12:06', '', 5, 'El usuario inicio sesion', '181.189.246.97');
INSERT INTO `bitacora` VALUES (662, 'Editar', '2021-11-29 21:12:24', 'servicio', 5, 'Se edito un servicio(29)', '181.189.246.97');
INSERT INTO `bitacora` VALUES (663, 'Editar', '2021-11-29 21:27:10', 'cliente', 34, 'Se edito un  cliente(080520001000656)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (664, 'Editar', '2021-11-29 21:36:25', 'Producto', 34, 'Se edito un Producto(148)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (665, 'Registrar', '2021-11-29 21:37:24', 'cotizacion', 5, 'Se registro una nueva cotizacion()', '181.189.246.97');
INSERT INTO `bitacora` VALUES (666, 'Registrar', '2021-11-29 21:37:36', 'accesos', 34, 'Se registro un acceso(24), en el usuario (34)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (667, 'Login', '2021-11-29 21:37:45', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (668, 'Editar', '2021-11-29 21:46:08', 'cotizacion', 34, 'Se edito una cotizacion(280)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (669, 'Login', '2021-11-29 21:54:49', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (670, 'Login', '2021-11-29 22:03:30', '', 5, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (671, 'Login', '2021-11-29 22:03:30', '', 34, 'El usuario inicio sesion', '::1');
INSERT INTO `bitacora` VALUES (672, 'Login', '2021-11-29 22:04:29', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (673, 'Editar', '2021-11-29 22:05:06', 'usuario', 34, 'Se edito usuario(34)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (674, 'Editar', '2021-11-29 22:05:13', 'usuario', 34, 'Se edito usuario(34)', '190.11.236.251');
INSERT INTO `bitacora` VALUES (675, 'Fecha', '2021-11-29 22:08:20', 'tarea', 5, 'Se cambio la fecha(102)', '170.231.52.142');
INSERT INTO `bitacora` VALUES (676, 'Editar', '2021-11-29 22:13:16', 'Producto', 5, 'Se edito un Producto(172)', '181.189.246.97');
INSERT INTO `bitacora` VALUES (677, 'Login', '2021-11-29 22:18:22', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (678, 'Login', '2021-11-29 22:21:48', '', 34, 'El usuario inicio sesion', '190.11.236.251');
INSERT INTO `bitacora` VALUES (679, 'Login', '2021-11-29 22:42:02', '', 5, 'El usuario inicio sesion', '181.189.246.97');
INSERT INTO `bitacora` VALUES (680, 'Login', '2021-11-29 22:50:50', '', 5, 'El usuario inicio sesion', '170.231.52.142');
INSERT INTO `bitacora` VALUES (681, 'Registrar', '2021-11-29 23:07:01', 'vehiculo', 34, 'Se registro un nuevo vehiculo', '190.11.236.251');
INSERT INTO `bitacora` VALUES (682, 'Registrar', '2021-11-29 23:07:07', 'vehiculo', 34, 'Se registro un nuevo vehiculo', '190.11.236.251');

-- ----------------------------
-- Table structure for bitacora_marca
-- ----------------------------
DROP TABLE IF EXISTS `bitacora_marca`;
CREATE TABLE `bitacora_marca`  (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `fecha_hora` datetime NULL DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL,
  PRIMARY KEY (`id_bitacora`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bitacora_marca
-- ----------------------------
INSERT INTO `bitacora_marca` VALUES (26, 'EDITAR', '2021-11-25 03:38:25', 'El usuario con id: 34 edito datos de la marca Toyota - 7');
INSERT INTO `bitacora_marca` VALUES (27, 'EDITAR', '2021-11-25 03:38:49', 'El usuario con id: 34 edito datos de la marca Toyota - 7');
INSERT INTO `bitacora_marca` VALUES (28, 'EDITAR', '2021-11-25 03:49:34', 'El usuario con id: 34 edito datos de la marca Lada - 24');
INSERT INTO `bitacora_marca` VALUES (29, 'EDITAR', '2021-11-29 21:48:17', 'El usuario con id: 5 edito datos de la marca  - 7');

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `categoria_fregistro` date NULL DEFAULT NULL,
  `categoria_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoria_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'Nuevo', '2021-09-26', 'ACTIVO');
INSERT INTO `categoria` VALUES (2, 'Accesorios', '2021-09-26', 'ACTIVO');
INSERT INTO `categoria` VALUES (4, 'Telecomunicaciones', '2021-10-08', 'INACTIVO');
INSERT INTO `categoria` VALUES (5, 'Balanceo', '2021-10-08', 'ACTIVO');
INSERT INTO `categoria` VALUES (8, 'Admisión y escape', '2021-11-15', 'ACTIVO');
INSERT INTO `categoria` VALUES (9, 'Motor', '2021-11-15', 'ACTIVO');
INSERT INTO `categoria` VALUES (10, 'Generalidades', '2021-11-15', 'ACTIVO');
INSERT INTO `categoria` VALUES (11, 'Combustible', '2021-11-15', 'ACTIVO');
INSERT INTO `categoria` VALUES (12, 'Lubricación de motor', '2021-11-15', 'ACTIVO');
INSERT INTO `categoria` VALUES (13, 'Sistema de refrigeración de motor ', '2021-11-15', 'ACTIVO');
INSERT INTO `categoria` VALUES (14, 'Electricidad', '2021-11-15', 'INACTIVO');
INSERT INTO `categoria` VALUES (15, 'Mantenimiento', '2021-11-24', 'ACTIVO');

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_fregistro` date NULL DEFAULT NULL,
  `cliente_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`cliente_id`) USING BTREE,
  INDEX `FK_CLIENTE_PERSONA`(`persona_id`) USING BTREE,
  CONSTRAINT `FK_CLIENTE_PERSONA` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES (23, '2021-11-25', 'ACTIVO', 57);
INSERT INTO `cliente` VALUES (24, '2021-11-25', 'ACTIVO', 58);
INSERT INTO `cliente` VALUES (25, '2021-11-25', 'ACTIVO', 59);
INSERT INTO `cliente` VALUES (26, '2021-11-25', 'ACTIVO', 60);
INSERT INTO `cliente` VALUES (27, '2021-11-25', 'ACTIVO', 61);
INSERT INTO `cliente` VALUES (28, '2021-11-29', 'ACTIVO', 65);
INSERT INTO `cliente` VALUES (29, '2021-11-29', 'ACTIVO', 66);

-- ----------------------------
-- Table structure for configuracion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion`  (
  `conf_id` int NOT NULL AUTO_INCREMENT,
  `conf_nombre_empresa` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_celular` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_rtn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_img_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_isv` decimal(2, 2) NULL DEFAULT NULL,
  `conf_cai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_fact_fechalimite_emision` date NULL DEFAULT NULL,
  `conf_cantidad_fact` int NULL DEFAULT NULL,
  `conf_numero_inicial` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_numero_final` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `conf_preciodolar` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`conf_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of configuracion
-- ----------------------------
INSERT INTO `configuracion` VALUES (8, 'MecaniSoft', 'Blvd. Morazán, Tegucigalpa Contiguo a Banco Atlantida', '2204-5620', '98786588', '080360005258', 'tallerautomotriz905@gmail.com', 'img/EMP25112021121233.jpg', 0.15, 'A5128E-9D1T85-K2546A6-8506GE-9FF952-3B', '2022-06-15', 7000, '000-001-00065001', '000-001-00072001', 24.10);

-- ----------------------------
-- Table structure for detalle_transaccion
-- ----------------------------
DROP TABLE IF EXISTS `detalle_transaccion`;
CREATE TABLE `detalle_transaccion`  (
  `detalletransaccion_id` int NOT NULL AUTO_INCREMENT,
  `transaccion_id` int NOT NULL,
  `detalletransaccion_cantidad` int NULL DEFAULT NULL,
  `detalletransaccion_precio` decimal(10, 2) NULL DEFAULT NULL,
  `detalletransaccion_descuento` decimal(10, 2) NULL DEFAULT NULL,
  `detalletransaccion_nombrepro` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_id` int NOT NULL,
  `detalletransaccion_estatus` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`detalletransaccion_id`) USING BTREE,
  INDEX `transaccion_id`(`transaccion_id`) USING BTREE,
  CONSTRAINT `fk` FOREIGN KEY (`transaccion_id`) REFERENCES `transacciones` (`transaccion_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 839 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detalle_transaccion
-- ----------------------------
INSERT INTO `detalle_transaccion` VALUES (703, 242, 15, 5200.70, 0.00, 'Computadora Automotriz para Acura CSX', 148, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (704, 242, 25, 350.50, 0.00, 'Aceite Motul 3/4', 147, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (705, 243, 1, 5200.70, 0.00, 'Computadora Automotriz para Acura CSX', 148, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (706, 243, 2, 350.50, 0.00, 'Aceite Motul 3/4', 147, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (707, 244, 20, 7.00, 0.00, 'Balinera 3mm bolsa', 171, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (709, 246, 1, 750.60, 0.00, 'Revisión de la distribución del encendido', 60, 'ORDEN ANULADA');
INSERT INTO `detalle_transaccion` VALUES (710, 247, 1, 360.00, 36.00, 'Cambio de Luces', 29, 'ORDEN ANULADA');
INSERT INTO `detalle_transaccion` VALUES (711, 248, 1, 750.60, 0.00, 'Revisión de la distribución del encendido', 60, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (712, 248, 1, 450.50, 0.00, 'Revisión de culata de cilindros', 59, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (713, 248, 1, 1300.25, 0.00, 'Reparación de culata de cilindros', 58, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (714, 248, 1, 900.50, 0.00, 'Reemplazo de tensor', 57, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (715, 248, 1, 4500.25, 0.00, 'Reemplazo de sello', 56, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (716, 248, 1, 80.20, 0.00, 'Reemplazo de polea', 55, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (717, 248, 1, 900.50, 0.00, 'Reemplazo fluido refrigerante', 88, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (718, 246, 3, 7.00, 1.05, 'Balinera 3mm bolsa', 171, 'ORDEN ANULADA');
INSERT INTO `detalle_transaccion` VALUES (719, 249, 1, 360.00, 36.00, 'Cambio de Luces', 29, 'ORDEN FACTURADA');
INSERT INTO `detalle_transaccion` VALUES (720, 250, 5, 870.50, 0.00, 'Bomba de Agua Cruze Tracker Sonic', 172, 'ANULADO');
INSERT INTO `detalle_transaccion` VALUES (721, 250, 10, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'ANULADO');
INSERT INTO `detalle_transaccion` VALUES (722, 250, 10, 8600.00, 0.00, 'Barra E. Tacoma/Prerunner', 182, 'ANULADO');
INSERT INTO `detalle_transaccion` VALUES (723, 250, 15, 1350.00, 0.00, 'Camisa de motor 1815', 177, 'ANULADO');
INSERT INTO `detalle_transaccion` VALUES (724, 250, 5, 194.50, 0.00, 'Filtro C-Santa Fe 2.2', 196, 'ANULADO');
INSERT INTO `detalle_transaccion` VALUES (725, 250, 8, 300.00, 0.00, 'Filtro C-111M', 195, 'ANULADO');
INSERT INTO `detalle_transaccion` VALUES (726, 251, 10, 290.50, 0.00, 'Aceite SAE 20w40 Marca ESSO', 175, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (727, 251, 15, 370.00, 0.00, 'Deposito o frasco de agua R058', 174, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (728, 251, 20, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (729, 251, 25, 870.50, 0.00, 'Bomba de Agua Cruze Tracker Sonic', 172, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (730, 251, 30, 5200.70, 0.00, 'Computadora Automotriz para Acura CSX', 148, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (731, 251, 15, 1100.50, 0.00, 'Amoritguadores Gabriel 34-87', 176, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (732, 251, 8, 780.25, 0.00, 'Balinera Sentra 98', 179, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (733, 251, 12, 1350.00, 0.00, 'Camisa de motor 1815', 177, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (734, 251, 5, 194.50, 0.00, 'Filtro C-Santa Fe 2.2', 196, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (735, 252, 5, 4300.20, 0.00, 'Propulsor TD27 4x2 98', 180, 'AJUSTE ANULADO');
INSERT INTO `detalle_transaccion` VALUES (736, 253, 1, 4300.20, 0.00, 'Propulsor TD27 4x2 98', 180, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (737, 254, 5, 4300.20, 0.00, 'Propulsor TD27 4x2 98', 180, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (742, 256, 1, 0.00, 0.00, 'Computadora Automotriz para Acura CSX', 148, 'MOVIMIENTO ANULADO');
INSERT INTO `detalle_transaccion` VALUES (743, 256, 1, 0.00, 0.00, 'Bomba de Agua Cruze Tracker Sonic', 172, 'MOVIMIENTO');
INSERT INTO `detalle_transaccion` VALUES (746, 257, 3, 0.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'MOVIMIENTO ANULADO');
INSERT INTO `detalle_transaccion` VALUES (747, 257, 4, 0.00, 0.00, 'Deposito o frasco de agua R058', 174, 'MOVIMIENTO ANULADO');
INSERT INTO `detalle_transaccion` VALUES (748, 258, 3, 0.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'MOVIMIENTO');
INSERT INTO `detalle_transaccion` VALUES (749, 258, 2, 0.00, 0.00, 'Deposito o frasco de agua R058', 174, 'MOVIMIENTO');
INSERT INTO `detalle_transaccion` VALUES (750, 259, 4, 1100.50, 0.00, 'Amoritguadores Gabriel 34-87', 176, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (751, 259, 3, 290.50, 0.00, 'Aceite SAE 20w40 Marca ESSO', 175, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (752, 259, 2, 370.00, 0.00, 'Deposito o frasco de agua R058', 174, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (753, 260, 10, 8600.00, 0.00, 'Barra E. Tacoma/Prerunner', 182, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (754, 260, 12, 2500.25, 0.00, 'Barra Pick-Up D22', 181, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (755, 260, 20, 4600.20, 0.00, 'Bomba T.HIDR Santa Fe', 183, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (756, 260, 25, 1900.25, 0.00, 'Bomba T.HDIR Elantra IX30', 184, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (757, 260, 25, 5800.25, 0.00, 'Brazo Trooper USB25', 185, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (758, 261, 10, 850.25, 0.00, 'Anillos 1ZZ 3&quot;SV 79M', 186, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (759, 261, 15, 3750.00, 0.00, 'Bal. Centro Coaster 1.35G', 187, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (760, 261, 40, 7900.25, 0.00, 'Culata Coaster 325G', 188, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (761, 261, 5, 431.25, 0.00, 'Banda ALT.1ZZ Corolla 97', 189, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (762, 261, 10, 370.25, 0.00, 'Botadores 1HZ/22R/-2L Hilux Modificado', 190, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (763, 261, 15, 2300.25, 0.00, 'Camisa 93.00M/M 4JA1', 192, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (764, 262, 3, 7.00, 3.15, 'Balinera 3mm bolsa', 171, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (765, 262, 3, 350.50, 0.00, 'Aceite Motul 3/4', 147, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (766, 262, 2, 1350.00, 0.00, 'Camisa de motor 1815', 177, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (767, 262, 1, 194.50, 0.00, 'Filtro C-Santa Fe 2.2', 196, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (768, 263, 2, 431.25, 0.00, 'Banda ALT.1ZZ Corolla 97', 189, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (769, 263, 2, 7900.25, 0.00, 'Culata Coaster 325G', 188, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (770, 263, 3, 3750.00, 0.00, 'Bal. Centro Coaster 1.35G', 187, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (771, 263, 3, 850.25, 0.00, 'Anillos 1ZZ 3&quot;SV 79M', 186, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (772, 263, 1, 5800.25, 0.00, 'Brazo Trooper USB25', 185, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (773, 263, 1, 1900.25, 0.00, 'Bomba T.HDIR Elantra IX30', 184, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (774, 264, 3, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (775, 264, 1, 870.50, 0.00, 'Bomba de Agua Cruze Tracker Sonic', 172, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (776, 264, 2, 5200.70, 0.00, 'Computadora Automotriz para Acura CSX', 148, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (777, 265, 2, 370.00, 0.00, 'Deposito o frasco de agua R058', 174, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (778, 265, 1, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (779, 266, 1, 2250.50, 0.00, 'Reemplazo de ducto de combustible', 72, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (780, 266, 1, 550.20, 0.00, 'Reemplazo de bomba de combustible', 71, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (781, 266, 1, 1500.00, 0.00, 'Cambio de Pistones', 178, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (782, 266, 1, 1300.25, 0.00, 'Reparación de culata de cilindros', 58, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (783, 266, 1, 4500.25, 0.00, 'Reemplazo de sello', 56, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (784, 245, 4, 7.00, 1.05, 'Balinera 3mm bolsa', 171, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (785, 267, 1, 1300.25, 0.00, 'Revisión general', 47, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (786, 267, 1, 1300.50, 0.00, 'Cambio de Buje', 193, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (787, 267, 1, 3600.05, 0.00, 'Reemplazo lubricante motor', 64, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (788, 267, 1, 260.32, 0.00, 'Reemplazo filtro lubricante motor', 65, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (789, 267, 1, 80.20, 0.00, 'Reemplazo de sensor de presión de lubricante motor', 66, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (790, 268, 1, 750.60, 0.00, 'Reemplazo de depósito de fluido refrigerante', 80, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (791, 268, 1, 450.50, 0.00, 'Reemplazo de correa de bomba de fluido refrigerante', 79, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (792, 268, 1, 1300.25, 0.00, 'Reemplazo de bomba de fluido refrigerante', 78, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (793, 268, 1, 900.50, 0.00, 'Inspección nivel fluido refrigerante', 77, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (794, 268, 1, 80.20, 0.00, 'Reemplazo de termostato', 86, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (795, 268, 1, 4500.25, 0.00, 'Reparación de intercambiador de calor', 87, 'ORDENADO');
INSERT INTO `detalle_transaccion` VALUES (796, 269, 1, 5200.70, 0.00, 'Computadora Automotriz para Acura CSX', 148, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (797, 269, 1, 870.50, 0.00, 'Bomba de Agua Cruze Tracker Sonic', 172, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (798, 269, 1, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (799, 269, 1, 370.00, 0.00, 'Deposito o frasco de agua R058', 174, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (800, 269, 1, 290.50, 0.00, 'Aceite SAE 20w40 Marca ESSO', 175, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (801, 269, 1, 360.00, 36.00, 'Cambio de Luces', 29, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (802, 269, 1, 150.00, 22.50, 'Cambio de Aceite+', 26, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (803, 270, 2, 780.25, 0.00, 'Balinera Sentra 98', 179, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (804, 270, 2, 1100.50, 0.00, 'Amoritguadores Gabriel 34-87', 176, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (805, 270, 3, 5200.70, 0.00, 'Computadora Automotriz para Acura CSX', 148, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (806, 271, 4, 870.50, 0.00, 'Bomba de Agua Cruze Tracker Sonic', 172, 'AJUSTE ANULADO');
INSERT INTO `detalle_transaccion` VALUES (807, 272, 4, 870.50, 0.00, 'Bomba de Agua Cruze Tracker Sonic', 172, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (808, 273, 3, 5200.70, 0.00, 'Computadora Automotriz para Acura CSX', 148, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (809, 273, 3, 870.50, 0.00, 'Bomba de Agua Cruze Tracker Sonic', 172, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (810, 273, 2, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (811, 273, 1, 370.00, 0.00, 'Deposito o frasco de agua R058', 174, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (812, 274, 9, 370.00, 0.00, 'Deposito o frasco de agua R058', 174, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (813, 275, 9, 370.00, 0.00, 'Deposito o frasco de agua R058', 174, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (814, 276, 7, 290.50, 0.00, 'Aceite SAE 20w40 Marca ESSO', 175, 'ORDEN FACTURADA');
INSERT INTO `detalle_transaccion` VALUES (815, 276, 1, 380.00, 38.00, 'Cambio de Luces+', 29, 'ORDEN FACTURADA');
INSERT INTO `detalle_transaccion` VALUES (816, 276, 1, 150.00, 22.50, 'Cambio de Aceite+', 26, 'ORDEN FACTURADA');
INSERT INTO `detalle_transaccion` VALUES (817, 277, 10, 290.50, 0.00, 'Aceite SAE 20w40 Marca ESSO', 175, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (818, 277, 15, 3498.00, 0.00, 'Puerta Laterall', 197, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (819, 277, 20, 7.00, 0.00, 'Balinera 3mm bolsa', 171, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (820, 277, 25, 1350.00, 0.00, 'Camisa de motor 1815', 177, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (821, 278, 3, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'ANULADO');
INSERT INTO `detalle_transaccion` VALUES (822, 278, 8, 870.50, 0.00, 'Bomba de Agua Cruze Tracker Sonicx', 172, 'ANULADO');
INSERT INTO `detalle_transaccion` VALUES (823, 279, 5, 350.50, 0.00, 'Aceite Motul 3/4', 147, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (824, 279, 5, 1350.00, 0.00, 'Camisa de motor 1815', 177, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (825, 279, 2, 7.00, 2.10, 'Balinera 3mm bolsa', 171, 'FACTURADO');
INSERT INTO `detalle_transaccion` VALUES (831, 280, 54, 4650.00, 0.00, 'Computadora Automotriz para Acura C', 148, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (832, 280, 47, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (833, 280, 1, 8600.00, 0.00, 'Barra E. Tacoma/Prerunner', 182, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (834, 280, 1, 2500.25, 0.00, 'Barra Pick-Up D22', 181, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (835, 280, 1, 4300.20, 0.00, 'Propulsor TD27 4x2 98', 180, 'COTIZADO');
INSERT INTO `detalle_transaccion` VALUES (836, 281, 10, 2030.00, 0.00, 'Bomba de Combustible Ford Escape 2010', 199, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (837, 282, 5, 600.00, 0.00, 'Carcasa Termostato Renault CLIO21', 173, 'INGRESADO');
INSERT INTO `detalle_transaccion` VALUES (838, 282, 10, 2030.00, 0.00, 'Bomba de Combustible Ford Escape 2010', 199, 'INGRESADO');

-- ----------------------------
-- Table structure for fabricante
-- ----------------------------
DROP TABLE IF EXISTS `fabricante`;
CREATE TABLE `fabricante`  (
  `id_fabricante` int NOT NULL AUTO_INCREMENT,
  `fabricante_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `fabricante_descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `fabricante_estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `fabricante_fregistro` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_fabricante`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fabricante
-- ----------------------------
INSERT INTO `fabricante` VALUES (11, 'La Mundial', 'Fabricante de Productos actualizando', 'ACTIVO', '2021-11-25');
INSERT INTO `fabricante` VALUES (12, 'Autorepuestos', '', 'ACTIVO', '2021-11-29');
INSERT INTO `fabricante` VALUES (13, 'Repuestos Atlantida', 'Distribuidora de respuestos', 'ACTIVO', '2021-11-29');

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca`  (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `marca_nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `marca_descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL,
  `marca_estado` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_marca`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of marca
-- ----------------------------
INSERT INTO `marca` VALUES (7, 'Toyota', '', 'ACTIVO');
INSERT INTO `marca` VALUES (8, 'Kia', '', 'ACTIVO');
INSERT INTO `marca` VALUES (9, 'Ford', '', 'ACTIVO');
INSERT INTO `marca` VALUES (10, 'BMW', '', 'ACTIVO');
INSERT INTO `marca` VALUES (11, 'Chevrolet', '', 'ACTIVO');
INSERT INTO `marca` VALUES (12, 'Ferrari', '', 'ACTIVO');
INSERT INTO `marca` VALUES (13, 'Fiat', '', 'ACTIVO');
INSERT INTO `marca` VALUES (14, 'Honda', '', 'ACTIVO');
INSERT INTO `marca` VALUES (15, 'Hyundai', '', 'ACTIVO');
INSERT INTO `marca` VALUES (16, 'Isuzu', '', 'ACTIVO');
INSERT INTO `marca` VALUES (17, 'Jeep', '', 'ACTIVO');
INSERT INTO `marca` VALUES (18, 'Mazda', '', 'ACTIVO');
INSERT INTO `marca` VALUES (19, 'Mitsubishi', '', 'ACTIVO');
INSERT INTO `marca` VALUES (20, 'Nissan', '', 'ACTIVO');
INSERT INTO `marca` VALUES (21, 'Seat', '', 'ACTIVO');
INSERT INTO `marca` VALUES (22, 'Suzuki', '', 'ACTIVO');
INSERT INTO `marca` VALUES (23, 'Volkswagen', '', 'ACTIVO');
INSERT INTO `marca` VALUES (24, 'Lada', '', 'INACTIVO');

-- ----------------------------
-- Table structure for modelo
-- ----------------------------
DROP TABLE IF EXISTS `modelo`;
CREATE TABLE `modelo`  (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `modelo_nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `modelo_descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL,
  `modelo_estado` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_marca` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_modelo`) USING BTREE,
  INDEX `fk_modelo_marca`(`id_marca`) USING BTREE,
  CONSTRAINT `fk_modelo_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of modelo
-- ----------------------------
INSERT INTO `modelo` VALUES (6, 'Prado', '', 'ACTIVO', 7);
INSERT INTO `modelo` VALUES (7, 'Hilux', '', 'INACTIVO', 7);
INSERT INTO `modelo` VALUES (8, 'Land Cruiser', '', 'ACTIVO', 7);
INSERT INTO `modelo` VALUES (9, 'Tacoma', '', 'ACTIVO', 7);
INSERT INTO `modelo` VALUES (10, 'Corola', '', 'ACTIVO', 7);
INSERT INTO `modelo` VALUES (11, 'Picanto', '', 'ACTIVO', 8);
INSERT INTO `modelo` VALUES (12, 'Rio', '', 'ACTIVO', 8);
INSERT INTO `modelo` VALUES (13, 'Venga', '', 'ACTIVO', 7);
INSERT INTO `modelo` VALUES (14, 'Sportage', '', 'ACTIVO', 8);
INSERT INTO `modelo` VALUES (15, 'Sorento', '', 'ACTIVO', 8);
INSERT INTO `modelo` VALUES (16, 'Optima GT', '', 'ACTIVO', 8);
INSERT INTO `modelo` VALUES (17, 'Fiesta', '', 'ACTIVO', 9);
INSERT INTO `modelo` VALUES (18, 'Focus', '', 'ACTIVO', 9);
INSERT INTO `modelo` VALUES (19, 'F-150', '', 'ACTIVO', 9);
INSERT INTO `modelo` VALUES (20, 'Scape', '', 'ACTIVO', 9);
INSERT INTO `modelo` VALUES (21, 'Mondelo', '', 'ACTIVO', 9);
INSERT INTO `modelo` VALUES (22, 'Mustang', '', 'ACTIVO', 9);
INSERT INTO `modelo` VALUES (23, 'Civic', '', 'ACTIVO', 14);
INSERT INTO `modelo` VALUES (24, 'Jazz', '', 'ACTIVO', 14);
INSERT INTO `modelo` VALUES (25, 'Accord', '', 'ACTIVO', 14);
INSERT INTO `modelo` VALUES (26, 'I20', '', 'ACTIVO', 15);
INSERT INTO `modelo` VALUES (27, 'Santa Fe', '', 'ACTIVO', 15);
INSERT INTO `modelo` VALUES (28, 'Elantra', '', 'ACTIVO', 15);
INSERT INTO `modelo` VALUES (29, 'Genesis', '', 'ACTIVO', 15);
INSERT INTO `modelo` VALUES (30, 'Kona', '', 'ACTIVO', 15);
INSERT INTO `modelo` VALUES (31, 'Mazda-2', '', 'ACTIVO', 18);
INSERT INTO `modelo` VALUES (32, 'Mazda-6', '', 'ACTIVO', 18);

-- ----------------------------
-- Table structure for modulo
-- ----------------------------
DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo`  (
  `modulo_codigo` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `modulo_nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `modulo_descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL,
  `modulo_estado` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`modulo_codigo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of modulo
-- ----------------------------
INSERT INTO `modulo` VALUES ('1', 'Formulario de Modelo', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('1-1', 'Agregar Modelo', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('1-2', 'Editar Modelo', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('10', 'Menu Ingreso', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('10-1', 'Filtros de busqueda', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('10-2', 'Agregar Ingreso', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('10-3', 'Imprimir Ingreso', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('10-4', 'Anular Ingreso', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('10-5', 'Visualizar Ingreso', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('11', 'Menu Cliente', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('11-1', 'Agregar Cliente', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('11-2', 'Editar Cliente', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('11-3', 'Activar Cliente', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('11-4', 'Desactivar Cliente', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('11-5', 'Visualizar Cliente', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('12', 'Menu Venta', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('12-1', 'Filtros Fecha Venta', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('12-2', 'Agregar Venta', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('12-3', 'Imprimir Factura', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('12-4', 'Anular Venta', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('12-5', 'Visualizar Venta', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13', 'Menu Cotizacion/Orden', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-1', 'Acceso a Manipulacion de fechas Orden/Cotizacion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-10', 'Editar Cotizacion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-11', 'Editar Orden de trabajo', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-12', 'Imprimir detalle orden', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-13', 'Imprimir factura Orden', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-2', 'Agregar Cotizacion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-3', 'Agregar Orden', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-4', 'Imprimir Reporte-Factura Cotizacion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-6', 'Anular Orden', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-7', 'Visualizar Orden', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-8', 'Visualizar Cotizacion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('13-9', 'Facturar Orden', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('14', 'Menu Movimientos', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('14-1', 'Filtros Fecha Movimientos', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('14-2', 'Agregar Movimiento', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('14-3', 'Imprimir Reporte Movimiento', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('14-4', 'Anular Movimiento', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('14-5', 'Visualizar Movimiento', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('14-6', 'Editar Movimiento', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('15', 'Menu Marca', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('15-1', 'Agregar Marca', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('15-2', 'Editar Marca', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('15-3', 'Visualizar Marca', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('16', 'Menu Modelo', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('16-1', 'Agregar Modelo', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('16-2', 'Editar Modelo', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('16-3', 'Visualizar Modelo', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('17', 'Menu Persona', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('17-1', 'Agregar Persona', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('17-2', 'Editar Persona', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18', 'Menu Usuario', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18-1', 'Agregar Usuario', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18-2', 'Editar Usuario', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18-3', 'Visualizar Usuario', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18-4', 'Visualizar Perfil Usuario', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18-5', 'Editar Foto Perfil', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18-6', 'Editar Informacion Usuario Perfil', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18-7', 'Editar Password Profile', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('18-8', 'Generar Contraseña Usuario', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('19', 'Menu Servicio', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('19-1', 'Agregar Servicio', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('19-2', 'Editar Servicio', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('19-3', 'Visualizar Servicio', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('19-4', 'Agregar Oferta Servicio', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('2', 'Formulario de Accesos', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('2-1', 'Agregar Accesos', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('2-2', 'Editar Accesos', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('2-3', 'Eliminar Accesos', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('2-4', 'Ver Accesos de usuarios', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('20', 'Menu Roles', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('20-1', 'Agregar Rol', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('20-2', 'Editar Rol', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('21', 'Visualizacion Notificaciones', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('22', 'Visualizacion Graficos', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('23', 'Acceso a bitacora', 'Acceso a ver la bitacora del sistema', 'ACTIVO');
INSERT INTO `modulo` VALUES ('24', 'Menu Configuracion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('24-1', 'Agregar Configuracion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('24-2', 'Editar Configuracion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('24-3', 'Visualizar Configuracion', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('3', 'Formulario de Vehiculos', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('3-1', 'Agregar Vehiculo', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('3-2', 'Editar Vehiculo', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('3-3', 'Visualizar Vehiculo', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('4', 'Menu Tarea', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('4-1', 'Visualizar Tarea', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('4-2', 'Editar Tarea', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('4-3', 'Agregar Tarea', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('4-4', 'Detalle Tarea', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('4-5', 'Editar Estado Tarea', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('4-6', 'Filtrar Tarea', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('5', 'Menu Producto', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('5-1', 'Agregar Producto', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('5-2', 'Editar Producto', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('5-3', 'Visualizar Producto', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('5-4', 'Agreagr Oferta Producto', 'Esta es una descripcion', 'ACTIVO');
INSERT INTO `modulo` VALUES ('6', 'Menu Categoria', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('6-1', 'Agregar Categoria', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('6-2', 'Editar Categoria', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('6-3', 'Visualizar Categoria', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('7', 'Menu Fabricante', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('7-1', 'Agregar Fabricante', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('7-2', 'Editar Fabricante', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('7-3', 'Visualizar fabricante', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('8', 'Menu Unidad Medida', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('8-1', 'Agregar Unidad de Medida', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('8-2', 'Editar Unidad de Medida', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('8-3', 'Visualizar Unidad de Medida', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('9', 'Menu Proveedor', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('9-1', 'Agregar Proveedor', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('9-2', 'Editar Proveedor', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('9-3', 'Activar Porveedor', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('9-4', 'Desactivar Proveedor', NULL, 'ACTIVO');
INSERT INTO `modulo` VALUES ('9-5', 'Visualizar Proveedor', NULL, 'ACTIVO');

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona`  (
  `persona_id` int NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_apepat` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_apmat` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_nrodocumento` varchar(17) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_tipodocumento` enum('IDENTIDAD','RTN','DNI','RUC','PASAPORTE') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_sexo` enum('MASCULINO','FEMENINO','OTRO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_correo` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_telefono` varchar(17) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_fregistro` date NULL DEFAULT NULL,
  `persona_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_empresa` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '',
  PRIMARY KEY (`persona_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES (1, 'Brayan Eludes', 'Alvarez', 'Gonzales', '080510020008', 'DNI', 'MASCULINO', '10brayanalvarez@gmail.com', '88821059', '2021-09-22', 'ACTIVO', '');
INSERT INTO `persona` VALUES (2, 'Alejandra ', 'Zuniga', 'Martinez', '0820100050034', 'RTN', 'FEMENINO', 'alejandro@gmail.com', '95201010', '2021-09-23', 'ACTIVO', NULL);
INSERT INTO `persona` VALUES (51, 'Abdiel Emanuel', 'Licona', 'Escobar', '0105200003646', 'DNI', 'MASCULINO', 'alicoescobar@gmail.com', '99564587', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (52, 'Marlon Ignacio', 'Benavidez', 'Hernandez', '0803200000956', 'IDENTIDAD', 'MASCULINO', 'marlon@gmail.com', '+50495201026', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (53, 'Hector Arturo', 'Benavidez', 'Canaca', '0803199900256', 'RTN', 'MASCULINO', 'hectorarturo@gmail.com', '+50498521683', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (54, 'German Saul', 'Banega', 'Alvarado', '1809199700210', 'RTN', 'MASCULINO', 'german05saul@gmail.com', '+50495632015', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (55, 'David Alejandro  ', 'Alvarez', 'Martinez', '0803199102547', 'RTN', 'MASCULINO', 'autorepuestos@gmail.com', '98201469', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (56, 'Artur Santiago', 'Castillo', 'Martinez', '080519920056', 'IDENTIDAD', 'MASCULINO', 'santiago@gmail.com', '+50498024601', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (57, 'Jonathan Josué', 'Canales', 'Ortega', '08052001569320', 'IDENTIDAD', 'MASCULINO', 'jonathan@gmail.com', '+50498521652', '2021-11-25', 'ACTIVO', 'Empresa01');
INSERT INTO `persona` VALUES (58, 'Karla Vanessa ', 'Zuniga', 'Martinez', '080510023569', 'IDENTIDAD', 'MASCULINO', 'karlavanesa@gmail.com', '+50498521685', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (59, 'Jorge Elias', 'Molina', 'Montoro', '1012198545203', 'IDENTIDAD', 'MASCULINO', 'jorge@gmail.com', '+504 89456578', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (60, 'Ever Joel', 'Valladares', 'Matamoro', '080520014899', 'IDENTIDAD', 'MASCULINO', 'joel@gmail.com', '+50498501020', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (61, 'Jose Luis', 'Medina', 'Carcamo', '080320000020', 'IDENTIDAD', 'MASCULINO', 'brayanuth0803@gmail.com', '+50494862510', '2021-11-25', 'ACTIVO', '');
INSERT INTO `persona` VALUES (62, 'Wilmer', 'Santos', 'Orellana', '0205200000546', 'IDENTIDAD', 'MASCULINO', 'mecanicoprueba@gmail.com', '98765634', '2021-11-28', 'ACTIVO', '');
INSERT INTO `persona` VALUES (63, 'Cristofer Josue', 'Hernandez', 'Licona', '0805200010039', 'RTN', 'OTRO', 'cristofer@gmail.com', '+50495632015', '2021-11-29', 'ACTIVO', '');
INSERT INTO `persona` VALUES (64, 'Jouse Hernesto', 'Figueroa', 'Valladares', '80320001000256', 'RTN', 'OTRO', 'josue@gmail.com', '98201469', '2021-11-29', 'ACTIVO', '');
INSERT INTO `persona` VALUES (65, 'Cristhian Alejandro', 'Padilla', 'Matamoros', '08011999000256', 'IDENTIDAD', 'MASCULINO', '', '+50495632015', '2021-11-29', 'ACTIVO', 'Empresa02');
INSERT INTO `persona` VALUES (66, 'Luis Daniel', 'Herrera', 'Alvarado', '080520001000656', 'IDENTIDAD', 'MASCULINO', 'luis@gmail.com', '+50498501020', '2021-11-29', 'ACTIVO', '');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `producto_nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_stock` int NULL DEFAULT NULL,
  `producto_stock_minimo` int NULL DEFAULT NULL,
  `categoria_id` int NULL DEFAULT NULL,
  `id_fabricante` int NULL DEFAULT NULL,
  `unidad_id` int NULL DEFAULT NULL,
  `producto_foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_preciocompra` decimal(10, 2) NULL DEFAULT NULL,
  `producto_precioventa` decimal(10, 2) NULL DEFAULT NULL,
  `producto_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_oferta` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  `producto_descuento` decimal(2, 2) NULL DEFAULT 0.00,
  `producto_descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `prod_serv_tipo` varchar(45) CHARACTER SET ujis COLLATE ujis_japanese_ci NULL DEFAULT NULL,
  `producto_codigo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`producto_id`) USING BTREE,
  INDEX `FK_PRODUCTO_CATEGORIA`(`categoria_id`) USING BTREE,
  INDEX `FK_PRODUCTO_UNIDAD`(`unidad_id`) USING BTREE,
  INDEX `FK_PRODUCTO_FABRICANTE`(`id_fabricante`) USING BTREE,
  INDEX `producto_codigo`(`producto_codigo`) USING BTREE,
  INDEX `producto_nombre`(`producto_nombre`) USING BTREE,
  CONSTRAINT `FK_PRODUCTO_CATEGORIA` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRODUCTO_FABRICANTE` FOREIGN KEY (`id_fabricante`) REFERENCES `fabricante` (`id_fabricante`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRODUCTO_UNIDAD` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_medida` (`unidad_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (26, 'Cambio de Aceite+', 0, 0, 2, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 150.00, 'ACTIVO', 1, 0.15, 'Servicio de Cambio de Aceite', 'SERVICIO', '89458934');
INSERT INTO `producto` VALUES (28, 'Cambio de Llantas', 0, 0, 10, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 551.00, 'ACTIVO', 1, 0.10, 'Cambio de Llantas', 'SERVICIO', '2354564');
INSERT INTO `producto` VALUES (29, 'Cambio de Luces', 0, 0, 1, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 380.00, 'ACTIVO', 1, 0.10, 'Cambio de luces', 'SERVICIO', '54188847');
INSERT INTO `producto` VALUES (30, 'Reparacion de Motor', 0, 0, 2, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1700.00, 'ACTIVO', 0, 0.00, 'Servicio Reparacion del Motor', 'SERVICIO', '94355072');
INSERT INTO `producto` VALUES (31, 'Cambio de Asientos', 0, 0, 10, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 450.00, 'ACTIVO', 0, 0.00, 'Detalle', 'SERVICIO', '89563534');
INSERT INTO `producto` VALUES (37, 'Inspección de catalizador', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 450.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413610');
INSERT INTO `producto` VALUES (38, 'Inspección de estanqueidad del sistema de admisión y escape', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 750.60, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413611');
INSERT INTO `producto` VALUES (39, 'Reemplazado de precámara', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1200.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413612');
INSERT INTO `producto` VALUES (40, 'Reemplazado de silenciador', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 550.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413613');
INSERT INTO `producto` VALUES (41, 'Reemplazo de catalizador', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 2250.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413614');
INSERT INTO `producto` VALUES (42, 'Reemplazo de ducto de escape', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 3600.05, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413615');
INSERT INTO `producto` VALUES (43, 'Reemplazo de junta de colector de escape', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 260.32, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413616');
INSERT INTO `producto` VALUES (44, 'Reemplazo de juntas de ducto de escape', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 80.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413617');
INSERT INTO `producto` VALUES (45, 'Reemplazo de soporte de ducto de escape', 0, 0, 8, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 4500.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413618');
INSERT INTO `producto` VALUES (46, 'Diagnóstico computarizado', 0, 0, 10, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 900.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413619');
INSERT INTO `producto` VALUES (47, 'Revisión general', 0, 0, 10, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1300.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413620');
INSERT INTO `producto` VALUES (48, 'Revisión programada1. ', 0, 0, 10, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 450.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413621');
INSERT INTO `producto` VALUES (49, 'Ajuste de la distribución de encendido', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 770.60, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413622');
INSERT INTO `producto` VALUES (50, 'Ajuste de la velocidad y mezcla de ralentí ', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1200.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413623');
INSERT INTO `producto` VALUES (51, 'Reemplazo de corona de arranque', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 550.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413624');
INSERT INTO `producto` VALUES (52, 'Reemplazo de correa de distribución', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 2250.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413625');
INSERT INTO `producto` VALUES (53, 'Reemplazo de empaquetadura de culata de cilindros', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 3600.05, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413626');
INSERT INTO `producto` VALUES (54, 'Reemplazo de ménsula de motor', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 260.32, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413627');
INSERT INTO `producto` VALUES (55, 'Reemplazo de polea', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 80.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413628');
INSERT INTO `producto` VALUES (56, 'Reemplazo de sello', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 4500.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413629');
INSERT INTO `producto` VALUES (57, 'Reemplazo de tensor', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 900.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413630');
INSERT INTO `producto` VALUES (58, 'Reparación de culata de cilindros', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1300.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413631');
INSERT INTO `producto` VALUES (59, 'Revisión de culata de cilindros', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 450.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413632');
INSERT INTO `producto` VALUES (60, 'Revisión de la distribución del encendido', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 750.60, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413633');
INSERT INTO `producto` VALUES (61, 'Revisión de la velocidad y mezcla de ralentí ', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1200.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413634');
INSERT INTO `producto` VALUES (62, 'Revisión del motor', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 550.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413635');
INSERT INTO `producto` VALUES (63, 'Inspección de nivel de lubricante de motor', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 2250.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413636');
INSERT INTO `producto` VALUES (64, 'Reemplazo lubricante motor', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 3600.05, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413637');
INSERT INTO `producto` VALUES (65, 'Reemplazo filtro lubricante motor', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 260.32, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413638');
INSERT INTO `producto` VALUES (66, 'Reemplazo de sensor de presión de lubricante motor', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 80.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413639');
INSERT INTO `producto` VALUES (67, 'Combustible', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 4500.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413640');
INSERT INTO `producto` VALUES (68, 'Limpieza de carburador', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 900.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '9160413641');
INSERT INTO `producto` VALUES (69, 'Limpieza de depósito de combustible', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1300.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041362');
INSERT INTO `producto` VALUES (70, 'Limpieza de inyectores', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1200.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041363');
INSERT INTO `producto` VALUES (71, 'Reemplazo de bomba de combustible', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 550.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041364');
INSERT INTO `producto` VALUES (72, 'Reemplazo de ducto de combustible', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 2250.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041365');
INSERT INTO `producto` VALUES (73, 'Reemplazo de tapón de depósito de combustible', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 3600.05, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041366');
INSERT INTO `producto` VALUES (74, 'Reemplazo filtro combustible', 0, 0, 12, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 260.32, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041367');
INSERT INTO `producto` VALUES (75, 'Ajuste de tensión de correa de bomba de fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 80.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041368');
INSERT INTO `producto` VALUES (76, 'Inspección de tapa de depósito de fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 4500.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041369');
INSERT INTO `producto` VALUES (77, 'Inspección nivel fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 900.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041370');
INSERT INTO `producto` VALUES (78, 'Reemplazo de bomba de fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1300.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041371');
INSERT INTO `producto` VALUES (79, 'Reemplazo de correa de bomba de fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 450.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041372');
INSERT INTO `producto` VALUES (80, 'Reemplazo de depósito de fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 750.60, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041373');
INSERT INTO `producto` VALUES (81, 'Reemplazo de ducto de fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1200.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041374');
INSERT INTO `producto` VALUES (82, 'Reemplazo de intercambiador de calor', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 550.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041375');
INSERT INTO `producto` VALUES (83, 'Reemplazo de motor de refrigeración', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 2250.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041376');
INSERT INTO `producto` VALUES (84, 'Reemplazo de relay de motor', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 3600.05, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041377');
INSERT INTO `producto` VALUES (85, 'Reemplazo de sensor de temperatura de fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 260.32, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041378');
INSERT INTO `producto` VALUES (86, 'Reemplazo de termostato', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 80.20, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041379');
INSERT INTO `producto` VALUES (87, 'Reparación de intercambiador de calor', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 4500.25, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041380');
INSERT INTO `producto` VALUES (88, 'Reemplazo fluido refrigerante', 0, 0, 13, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 900.50, 'ACTIVO', 0, 0.00, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!', 'SERVICIO', '916041381');
INSERT INTO `producto` VALUES (146, 'Limpieza de motor', 0, 0, 5, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 200.00, 'ACTIVO', 0, 0.00, 'Esta es una descripcion', 'SERVICIO', '73605042');
INSERT INTO `producto` VALUES (147, 'Aceite Motul 3/4', 15, 5, 9, 11, 3, 'controlador/producto/img/producto_default.png', 250.25, 350.50, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '90799141');
INSERT INTO `producto` VALUES (148, 'Computadora Automotriz para Acura C', 42, 10, 9, 11, 1, 'controlador/producto/img/producto_default.png', 4600.25, 4650.00, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '86281149');
INSERT INTO `producto` VALUES (169, 'Cambio Pistones Toyota', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 250.25, 'ACTIVO', 0, 0.00, '', 'SERVICIO', '89192193');
INSERT INTO `producto` VALUES (170, 'Servicio de prueba', 0, 0, 1, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 0.00, 'INACTIVO', 0, 0.00, 'dsfsdf', 'SERVICIO', '88183569');
INSERT INTO `producto` VALUES (171, 'Balinera 3mm bolsa', 35, 3, 1, 11, 4, 'controlador/producto/img/producto_default.png', 5.50, 7.00, 'ACTIVO', 1, 0.15, 'Esta es una descripción del producto', 'PRODUCTO', '53294455');
INSERT INTO `producto` VALUES (172, 'Bomba de Agua Cruze Tracker Sonic', 22, 5, 9, 11, 1, 'controlador/producto/img/producto_default.png', 750.25, 890.50, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '84334076');
INSERT INTO `producto` VALUES (173, 'Carcasa Termostato Renault CLIO21', 16, 5, 10, 11, 1, 'controlador/producto/img/producto_default.png', 350.50, 600.00, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '19444038');
INSERT INTO `producto` VALUES (174, 'Deposito o frasco de agua R058', 8, 5, 12, 11, 1, 'controlador/producto/img/producto_default.png', 300.20, 370.00, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '96656969');
INSERT INTO `producto` VALUES (175, 'Aceite SAE 20w40 Marca ESSO', 10, 5, 1, 11, 1, 'controlador/producto/img/producto_default.png', 250.50, 290.50, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '89296943');
INSERT INTO `producto` VALUES (176, 'Amoritguadores Gabriel 34-87', 13, 5, 5, 11, 1, 'controlador/producto/img/producto_default.png', 900.00, 1100.50, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '17118156');
INSERT INTO `producto` VALUES (177, 'Camisa de motor 1815', 30, 5, 1, 11, 2, 'controlador/producto/img/producto_default.png', 1200.50, 1350.00, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '93550407');
INSERT INTO `producto` VALUES (178, 'Cambio de Pistones', 0, 0, 10, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1500.00, 'ACTIVO', 0, 0.00, 'Cambio de Piston para mejoramiento del motor', 'SERVICIO', '23787834');
INSERT INTO `producto` VALUES (179, 'Balinera Sentra 98', 10, 8, 10, 11, 1, 'controlador/producto/img/producto_default.png', 600.50, 780.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '36489684');
INSERT INTO `producto` VALUES (180, 'Propulsor TD27 4x2 98', 4, 3, 1, 11, 1, 'controlador/producto/img/producto_default.png', 4100.50, 4300.20, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '37629730');
INSERT INTO `producto` VALUES (181, 'Barra Pick-Up D22', 12, 5, 1, 11, 1, 'controlador/producto/img/producto_default.png', 2000.00, 2500.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '76173251');
INSERT INTO `producto` VALUES (182, 'Barra E. Tacoma/Prerunner', 10, 5, 1, 11, 1, 'controlador/producto/img/producto_default.png', 7500.00, 8600.00, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '90022030');
INSERT INTO `producto` VALUES (183, 'Bomba T.HIDR Santa Fe', 20, 5, 1, 11, 1, 'controlador/producto/img/producto_default.png', 4500.50, 4600.20, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '56531554');
INSERT INTO `producto` VALUES (184, 'Bomba T.HDIR Elantra IX30', 24, 5, 1, 11, 1, 'controlador/producto/img/producto_default.png', 1600.50, 1900.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '73266037');
INSERT INTO `producto` VALUES (185, 'Brazo Trooper USB25', 24, 5, 9, 11, 1, 'controlador/producto/img/producto_default.png', 5500.20, 5800.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '42884770');
INSERT INTO `producto` VALUES (186, 'Anillos 1ZZ 3&quot;SV 79M', 7, 5, 1, 11, 1, 'controlador/producto/img/producto_default.png', 780.25, 850.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '80103984');
INSERT INTO `producto` VALUES (187, 'Bal. Centro Coaster 1.35G', 12, 5, 5, 11, 1, 'controlador/producto/img/producto_default.png', 3200.00, 3750.00, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '65878415');
INSERT INTO `producto` VALUES (188, 'Culata Coaster 325G', 38, 5, 9, 11, 1, 'controlador/producto/img/producto_default.png', 7200.35, 7900.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '26137988');
INSERT INTO `producto` VALUES (189, 'Banda ALT.1ZZ Corolla 97', 3, 5, 10, 11, 1, 'controlador/producto/img/producto_default.png', 430.20, 431.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '41937818');
INSERT INTO `producto` VALUES (190, 'Botadores 1HZ/22R/-2L Hilux Modificado', 10, 5, 9, 11, 1, 'controlador/producto/img/producto_default.png', 300.50, 370.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '24409796');
INSERT INTO `producto` VALUES (191, 'Buje Pistones 18R-22R', 0, 5, 10, 11, 1, 'controlador/producto/img/producto_default.png', 200.25, 200.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '75364424');
INSERT INTO `producto` VALUES (192, 'Camisa 93.00M/M 4JA1', 15, 5, 10, 11, 1, 'controlador/producto/img/producto_default.png', 2000.50, 2300.25, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '59843550');
INSERT INTO `producto` VALUES (193, 'Cambio de Buje', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1300.50, 'ACTIVO', 0, 0.00, '', 'SERVICIO', '37232433');
INSERT INTO `producto` VALUES (194, 'Cambio de filtro', 0, 0, 9, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 900.50, 'ACTIVO', 0, 0.00, '', 'SERVICIO', '79832659');
INSERT INTO `producto` VALUES (195, 'Filtro C-111M', 0, 5, 12, 11, 1, 'controlador/producto/img/producto_default.png', 250.00, 300.00, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '33322277');
INSERT INTO `producto` VALUES (196, 'Filtro C-Santa Fe 2.2', 4, 5, 12, 11, 1, 'controlador/producto/img/producto_default.png', 150.00, 194.50, 'ACTIVO', 0, 0.00, '', 'PRODUCTO', '21811734');
INSERT INTO `producto` VALUES (197, 'Puerta Laterall', 15, 10, 2, 11, 5, 'controlador/producto/img/producto_default.png', 2500.00, 3498.00, 'ACTIVO', 0, 0.00, 'Puerta Lateral Toyota', 'PRODUCTO', '35172303');
INSERT INTO `producto` VALUES (198, 'Cambio de VidriosS', 0, 0, 10, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 780.00, 'ACTIVO', 0, 0.00, 'Cambio de Vidrios para todo tipo de automovil', 'SERVICIO', '64941165');
INSERT INTO `producto` VALUES (199, 'Bomba de Combustible Ford Escape 2010', 20, 10, 11, 11, 3, 'controlador/producto/img/producto_default.png', 1500.00, 2030.00, 'ACTIVO', 1, 0.10, 'Bomba de combustible ford escape', 'PRODUCTO', '72164805');
INSERT INTO `producto` VALUES (200, 'Cambio de Vidrios', 0, 0, 2, NULL, NULL, 'controlador/servicio/img/producto_default.png', 0.00, 1000.00, 'ACTIVO', 0, 0.00, 'Cambio de Vidrios', 'SERVICIO', '71810853');

-- ----------------------------
-- Table structure for producto_historial
-- ----------------------------
DROP TABLE IF EXISTS `producto_historial`;
CREATE TABLE `producto_historial`  (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_nombre_nuevo` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_precio_venta` decimal(10, 2) NULL DEFAULT NULL,
  `producto_precio_venta_nuevo` decimal(10, 2) NULL DEFAULT NULL,
  `prod_serv_tipo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `fecha_historial` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_historial`) USING BTREE,
  INDEX `fkey_productocodigo_historial`(`producto_codigo`) USING BTREE,
  INDEX `fkey_productonombre_historial`(`producto_nombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producto_historial
-- ----------------------------
INSERT INTO `producto_historial` VALUES (33, '54188847', 'Cambio de Luces+', 'Cambio de Luces', 360.00, 360.00, 'SERVICIO', '2021-11-25 04:02:15');
INSERT INTO `producto_historial` VALUES (34, '88183569', 'dsfsfs', 'Servicio de prueba', 5555.00, 0.00, 'SERVICIO', '2021-11-25 05:06:14');
INSERT INTO `producto_historial` VALUES (35, '86281149', 'Computadora Automotriz para Acura CSX', 'Computadora Automotriz para Acura CSXX', 5200.70, 5200.70, 'PRODUCTO', '2021-11-25 17:25:00');
INSERT INTO `producto_historial` VALUES (36, '000204669', 'Cambio de pistones', 'Cambio de piston', 250.00, 250.00, 'SERVICIO', '2021-11-25 17:45:00');
INSERT INTO `producto_historial` VALUES (37, '000204669', 'Cambio de piston', 'Cambio de pistones', 250.00, 250.00, 'SERVICIO', '2021-11-25 17:45:43');
INSERT INTO `producto_historial` VALUES (38, '19444038', 'Carcasa Termostato Renault CLIO2', 'Carcasa Termostato Renault CLIO21', 600.00, 600.00, 'PRODUCTO', '2021-11-25 17:47:50');
INSERT INTO `producto_historial` VALUES (39, '89458934', 'Cambio de Aceite', 'Cambio de Aceite+', 150.00, 150.00, 'SERVICIO', '2021-11-25 17:50:43');
INSERT INTO `producto_historial` VALUES (40, '9160413622', 'Ajuste de la distribución del encendido', 'Ajuste de la distribución de encendido', 750.60, 750.60, 'SERVICIO', '2021-11-25 17:53:28');
INSERT INTO `producto_historial` VALUES (41, '9160413622', 'Ajuste de la distribución de encendido', 'Ajuste de la distribución de encendido', 750.60, 770.60, 'SERVICIO', '2021-11-25 17:53:50');
INSERT INTO `producto_historial` VALUES (42, '23787834', 'Cambio de Piston', 'Cambio de Pistones', 1500.00, 1500.00, 'SERVICIO', '2021-11-25 17:56:57');
INSERT INTO `producto_historial` VALUES (43, '86281149', 'Computadora Automotriz para Acura CSXX', 'Computadora Automotriz para Acura CSX', 5200.70, 5200.70, 'PRODUCTO', '2021-11-25 18:14:39');
INSERT INTO `producto_historial` VALUES (44, '94355072', 'Reparacion de Motor', 'Reparacion de Motor', 700.00, 1700.00, 'SERVICIO', '2021-11-25 18:43:18');
INSERT INTO `producto_historial` VALUES (45, '90022030', 'Barra E. Tacoma/Prerunner', 'Barra E. Tacoma/Prerunner', 250.00, 8600.00, 'PRODUCTO', '2021-11-25 19:27:34');
INSERT INTO `producto_historial` VALUES (46, '35172303', 'Puerta Lateral', 'Puerta Laterall', 3498.00, 3498.00, 'PRODUCTO', '2021-11-26 00:21:07');
INSERT INTO `producto_historial` VALUES (47, '64941165', 'Cambio de Vidrios', 'Cambio de VidriosS', 780.00, 780.00, 'SERVICIO', '2021-11-26 00:23:10');
INSERT INTO `producto_historial` VALUES (48, '72164805', 'Bomba de Combustible Ford Escape 2009', 'Bomba de Combustible Ford Escape 2010', 2000.00, 2030.00, 'PRODUCTO', '2021-11-26 00:50:17');
INSERT INTO `producto_historial` VALUES (49, '84334076', 'Bomba de Agua Cruze Tracker Sonic', 'Bomba de Agua Cruze Tracker Sonicx', 870.50, 870.50, 'PRODUCTO', '2021-11-27 17:21:00');
INSERT INTO `producto_historial` VALUES (50, '86281149', 'Computadora Automotriz para Acura CSX', 'Computadora Automotriz para Acura CS', 5200.70, 5200.70, 'PRODUCTO', '2021-11-28 22:45:26');
INSERT INTO `producto_historial` VALUES (51, '86281149', 'Computadora Automotriz para Acura CS', 'Computadora Automotriz para Acura CSNF', 5200.70, 5200.70, 'PRODUCTO', '2021-11-28 22:56:46');
INSERT INTO `producto_historial` VALUES (52, '54188847', 'Cambio de Luces', 'Cambio de Luces+', 360.00, 360.00, 'SERVICIO', '2021-11-28 23:05:48');
INSERT INTO `producto_historial` VALUES (53, '54188847', 'Cambio de Luces+', 'Cambio de Luces+', 360.00, 380.00, 'SERVICIO', '2021-11-28 23:06:12');
INSERT INTO `producto_historial` VALUES (54, '54188847', 'Cambio de Luces+', 'Cambio de Luces', 380.00, 380.00, 'SERVICIO', '2021-11-29 20:57:13');
INSERT INTO `producto_historial` VALUES (55, '86281149', 'Computadora Automotriz para Acura CSNF', 'Computadora Automotriz para Acura C', 5200.70, 5200.70, 'PRODUCTO', '2021-11-29 21:00:43');
INSERT INTO `producto_historial` VALUES (56, '86281149', 'Computadora Automotriz para Acura C', 'Computadora Automotriz para Acura C', 5200.70, 4.00, 'PRODUCTO', '2021-11-29 21:01:05');
INSERT INTO `producto_historial` VALUES (57, '86281149', 'Computadora Automotriz para Acura C', 'Computadora Automotriz para Acura C', 4.00, 4650.00, 'PRODUCTO', '2021-11-29 21:03:57');
INSERT INTO `producto_historial` VALUES (58, '84334076', 'Bomba de Agua Cruze Tracker Sonicx', 'Bomba de Agua Cruze Tracker Sonic', 870.50, 890.50, 'PRODUCTO', '2021-11-29 22:13:16');

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor`  (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_numcontacto` varchar(17) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `proveedor_contacto` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `proveedor_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_id` int NULL DEFAULT NULL,
  `proveedor_razonsocial` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`) USING BTREE,
  INDEX `FK_PROVEEDOR_PERSONA`(`persona_id`) USING BTREE,
  CONSTRAINT `FK_PROVEEDOR_PERSONA` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES (10, '94521603', 'Samuel Cortez', 'ACTIVO', 53, 'La Mundial');
INSERT INTO `proveedor` VALUES (11, '50496201345', 'Karla Suarez Benavidez', 'ACTIVO', 54, 'Parrillas y Repuestos ONE');
INSERT INTO `proveedor` VALUES (12, '96201458', 'Linda Diaz', 'ACTIVO', 55, 'Autorepuestos AR');
INSERT INTO `proveedor` VALUES (13, '98502045', 'Bairon Figueroa', 'ACTIVO', 63, 'Repuestos Bajaj');
INSERT INTO `proveedor` VALUES (14, '98502010', 'Maynor Alvarado', 'ACTIVO', 64, 'ToyotaRep');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rol_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rol_feregistro` date NULL DEFAULT NULL,
  PRIMARY KEY (`rol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, '', 'ACTIVO', '2021-09-23');
INSERT INTO `rol` VALUES (12, 'ALMACENERO', 'ACTIVO', '2021-10-10');
INSERT INTO `rol` VALUES (13, 'VENDEDOR', 'ACTIVO', '2021-10-10');
INSERT INTO `rol` VALUES (14, 'MECANICO', 'ACTIVO', '2021-11-08');
INSERT INTO `rol` VALUES (16, 'CLIENTE', 'ACTIVO', '2021-11-20');

-- ----------------------------
-- Table structure for tarea
-- ----------------------------
DROP TABLE IF EXISTS `tarea`;
CREATE TABLE `tarea`  (
  `id_tarea` int NOT NULL AUTO_INCREMENT,
  `detalletransaccion_id` int NULL DEFAULT NULL,
  `fecha_inicio` date NULL DEFAULT NULL,
  `fecha_fin` date NULL DEFAULT NULL,
  `tarea_notas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `usuario_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_tarea`) USING BTREE,
  INDEX `tarea_ibfk_1`(`detalletransaccion_id`) USING BTREE,
  INDEX `usuario_id`(`usuario_id`) USING BTREE,
  CONSTRAINT `tarea_ibfk_1` FOREIGN KEY (`detalletransaccion_id`) REFERENCES `detalle_transaccion` (`detalletransaccion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tarea_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tarea
-- ----------------------------
INSERT INTO `tarea` VALUES (83, 710, '2021-11-25', '2021-11-28', 'El cableado de el tablero esta bastante defectuoso se recomienda hacerle mantenimiento', 'FINALIZADO', 36);
INSERT INTO `tarea` VALUES (89, 709, '2021-11-11', '2021-11-12', 'Esta es una observacion', 'ORDEN ANULADA', NULL);
INSERT INTO `tarea` VALUES (90, 711, '2021-12-02', '2021-12-04', '', 'PENDIENTE', NULL);
INSERT INTO `tarea` VALUES (91, 712, '2021-11-26', '2021-11-27', 'Cilindros bastante bien con el cambio realizado se recomienda dentro de 2 meses volver a revisarlos', 'FINALIZADO', NULL);
INSERT INTO `tarea` VALUES (92, 717, '2021-11-30', '2021-12-01', '', 'PENDIENTE', NULL);
INSERT INTO `tarea` VALUES (93, 714, '2021-12-01', '2021-12-03', 'Esta es una descripcion opcional del automovil que se pretende reparar', 'FINALIZADO', 36);
INSERT INTO `tarea` VALUES (94, 715, '2021-12-01', '2021-12-02', '', 'PENDIENTE', NULL);
INSERT INTO `tarea` VALUES (95, 719, '2021-12-05', '2021-12-06', '', 'FINALIZADO', 36);
INSERT INTO `tarea` VALUES (96, 713, '2021-11-25', '2021-11-26', '', 'PENDIENTE', NULL);
INSERT INTO `tarea` VALUES (97, 779, '2021-11-26', '2021-11-27', 'Debe tener cuiadado en las gasolineras donde se surte de combustible el tipo de comstible esta dañando el ducto', 'FINALIZADO', 5);
INSERT INTO `tarea` VALUES (98, 780, '2021-11-26', '2021-11-27', '', 'PENDIENTE', NULL);
INSERT INTO `tarea` VALUES (99, 783, '2021-12-03', '2021-12-04', 'Iniciando el reemplazo', 'FINALIZADO', 36);
INSERT INTO `tarea` VALUES (101, 781, '2021-11-30', '2021-12-02', 'Se esta alargando la tarea hemos encontrado problemas en la caja del utomovil', 'PENDIENTE', 5);
INSERT INTO `tarea` VALUES (102, 786, '2021-11-24', '2021-11-25', 'Iniciando Cambio de buje', 'PENDIENTE', NULL);
INSERT INTO `tarea` VALUES (103, 787, '2021-11-25', '2021-11-26', '', 'PENDIENTE', NULL);
INSERT INTO `tarea` VALUES (104, 788, '2021-12-08', '2021-12-11', '', 'PENDIENTE', NULL);
INSERT INTO `tarea` VALUES (105, 815, '2021-12-06', '2021-12-07', '', 'FINALIZADO', 34);
INSERT INTO `tarea` VALUES (106, 816, '2021-12-06', '2021-12-07', '', 'FINALIZADO', 34);
INSERT INTO `tarea` VALUES (107, 782, '2021-12-07', '2021-12-08', '', 'PENDIENTE', NULL);

-- ----------------------------
-- Table structure for transaccion_proveedor
-- ----------------------------
DROP TABLE IF EXISTS `transaccion_proveedor`;
CREATE TABLE `transaccion_proveedor`  (
  `transaccion_id` int NULL DEFAULT NULL,
  `proveedor_id` int NULL DEFAULT NULL,
  INDEX `id_proveedor`(`proveedor_id`) USING BTREE,
  INDEX `transaccion_id`(`transaccion_id`) USING BTREE,
  CONSTRAINT `transaccion_proveedor_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaccion_proveedor_ibfk_3` FOREIGN KEY (`transaccion_id`) REFERENCES `transacciones` (`transaccion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaccion_proveedor
-- ----------------------------
INSERT INTO `transaccion_proveedor` VALUES (242, 11);
INSERT INTO `transaccion_proveedor` VALUES (244, 11);
INSERT INTO `transaccion_proveedor` VALUES (250, 12);
INSERT INTO `transaccion_proveedor` VALUES (251, 12);
INSERT INTO `transaccion_proveedor` VALUES (252, 11);
INSERT INTO `transaccion_proveedor` VALUES (254, 11);
INSERT INTO `transaccion_proveedor` VALUES (260, 10);
INSERT INTO `transaccion_proveedor` VALUES (261, 12);
INSERT INTO `transaccion_proveedor` VALUES (270, 12);
INSERT INTO `transaccion_proveedor` VALUES (271, 11);
INSERT INTO `transaccion_proveedor` VALUES (272, 11);
INSERT INTO `transaccion_proveedor` VALUES (277, 14);
INSERT INTO `transaccion_proveedor` VALUES (278, 13);
INSERT INTO `transaccion_proveedor` VALUES (281, 11);
INSERT INTO `transaccion_proveedor` VALUES (282, 11);

-- ----------------------------
-- Table structure for transaccion_vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `transaccion_vehiculo`;
CREATE TABLE `transaccion_vehiculo`  (
  `id_transaccion` int NOT NULL,
  `id_vehiculo` int NOT NULL,
  `nivel_combustible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vehiculo_km/millas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_usuario` int NULL DEFAULT NULL COMMENT 'Campo para el registro del usuario tipo mecanico que hara los servicios al vehiculo',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id_transaccion`, `id_vehiculo`) USING BTREE,
  INDEX `fk_tranveh_idveh`(`id_vehiculo`) USING BTREE,
  INDEX `fk_tranveh_idusuario`(`id_usuario`) USING BTREE,
  CONSTRAINT `fk_tranveh_idtran` FOREIGN KEY (`id_transaccion`) REFERENCES `transacciones` (`transaccion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tranveh_idusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tranveh_idveh` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaccion_vehiculo
-- ----------------------------
INSERT INTO `transaccion_vehiculo` VALUES (246, 12, '1/4', '1500Km', 35, 'El auto presenta fallas en el arranque');
INSERT INTO `transaccion_vehiculo` VALUES (247, 11, 'E', '1000Km', 35, 'Esta es una descripcion');
INSERT INTO `transaccion_vehiculo` VALUES (248, 13, '1/2', '3000', 36, 'Problemas en las balineras y computadora del automovil, ademas de el aire acondicionado');
INSERT INTO `transaccion_vehiculo` VALUES (249, 11, 'E', '1000Km', 35, 'Esta es una desc');
INSERT INTO `transaccion_vehiculo` VALUES (266, 14, '1/4', '25000', 36, 'Problemas en la culata y pistones');
INSERT INTO `transaccion_vehiculo` VALUES (267, 15, '1/4', '6000', 36, 'fallos en las bandas ');
INSERT INTO `transaccion_vehiculo` VALUES (268, 16, 'F', '3000', 36, 'Tiene un problema en el sistema eléctrico');
INSERT INTO `transaccion_vehiculo` VALUES (276, 11, '1/4', '123', 36, 'rjejdjdjdjdjdjdj');

-- ----------------------------
-- Table structure for transacciones
-- ----------------------------
DROP TABLE IF EXISTS `transacciones`;
CREATE TABLE `transacciones`  (
  `transaccion_id` int NOT NULL AUTO_INCREMENT,
  `id_correlativo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `transaccion_tipocomprobante` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `transaccion_seriecomprobante` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `transaccion_numcomprobante` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `transaccion_fecha` datetime NULL DEFAULT NULL,
  `transaccion_impuesto` decimal(10, 2) NULL DEFAULT NULL,
  `transaccion_total` decimal(10, 2) NULL DEFAULT NULL,
  `transaccion_estatus` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `transaccion_descuento` decimal(10, 2) NULL DEFAULT NULL,
  `transaccion_porcentaje` decimal(2, 2) NULL DEFAULT NULL,
  `transaccion_observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL,
  `persona_id` int NULL DEFAULT NULL,
  `usuario_id` int NULL DEFAULT NULL,
  `transaccion_tipo` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `transaccion_cantidadpago` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`transaccion_id`) USING BTREE,
  INDEX `usuario_id`(`usuario_id`) USING BTREE,
  INDEX `persona_id`(`persona_id`) USING BTREE,
  CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transacciones_ibfk_3` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 283 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transacciones
-- ----------------------------
INSERT INTO `transacciones` VALUES (242, 'ING-00001', 'FACTURA', '0000001', '0000001', '2021-11-25 03:54:11', 13015.95, 99788.95, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (243, 'FAC-0000243', 'FACTURA', '000-001-00072001    ', '000-001-00065001', '2021-11-25 04:07:28', 885.25, 6786.95, 'FACTURADO', 0.00, 0.15, '', 52, 5, 'VENTA', 6790.00);
INSERT INTO `transacciones` VALUES (244, 'ING-0000244', 'FACTURA', '0000002', '0000002', '2021-11-25 05:20:10', 21.00, 161.00, 'INGRESADO', 0.00, 0.15, '', NULL, 34, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (245, 'COT-0000245', '', '', '', '2021-11-25 20:59:38', 4.20, 28.00, 'COTIZADO', 4.20, 0.15, '', 59, 5, 'COTIZACION', 0.00);
INSERT INTO `transacciones` VALUES (246, 'ORD-0000246', '', '', '', '2021-11-25 06:06:49', 115.74, 884.19, 'ORDEN ANULADA', 3.15, 0.15, 'El auto presenta fallas en el arranque', 57, 34, 'ORDEN', 0.00);
INSERT INTO `transacciones` VALUES (247, 'ORD-0000247', '', '', '', '2021-11-25 06:13:07', 54.00, 378.00, 'ORDEN ANULADA', 36.00, 0.15, '', 57, 34, 'ORDEN', 0.00);
INSERT INTO `transacciones` VALUES (248, 'ORD-0000248', '', '', '', '2021-11-25 06:34:35', 1332.42, 10215.22, 'INICIADO', 0.00, 0.15, '', 58, 5, 'ORDEN', 0.00);
INSERT INTO `transacciones` VALUES (249, 'ORD-0000249', 'FACTURA', '000-001-00072001    ', '000-001-00065002    ', '2021-11-25 06:55:54', 54.00, 378.00, 'ORDEN FACTURADA', 36.00, 0.15, '', 57, 34, 'ORDEN', 400.00);
INSERT INTO `transacciones` VALUES (250, 'ING-0000250', 'FACTURA', '0000003', '0000003', '2021-11-25 20:01:21', 17996.25, 137971.25, 'ANULADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (251, 'ING-0000251', 'FACTURA', '0000004', '0000004', '2021-11-25 20:04:45', 35724.07, 273884.57, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (252, 'AJT-0000252', 'AJUSTE', '0000005', '0000005', '2021-11-25 20:06:51', 3225.15, 24726.15, 'AJUSTE ANULADO', 0.00, 0.15, '', NULL, 5, 'AJUSTE', 0.00);
INSERT INTO `transacciones` VALUES (253, 'FAC-0000253', 'FACTURA', '000-001-00072001    ', '000-001-00065002    ', '2021-11-25 20:08:50', 645.03, 4945.23, 'FACTURADO', 0.00, 0.15, '', 52, 5, 'VENTA', 4946.20);
INSERT INTO `transacciones` VALUES (254, 'ING-0000254', 'FACTURA', '0000006', '0000006', '2021-11-25 20:10:16', 3225.15, 24726.15, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (256, 'MOV-0000255', '', '', '', '2021-11-25 20:23:19', 0.00, 0.00, 'MOVIMIENTO ANULADO', 0.00, 0.00, 'El primer producto tiene un defecto que lo deja inservible para facturar, están totalmente dañados, no es conveniente dejarlos en stock.', NULL, 5, 'MOVIMIENTO', 0.00);
INSERT INTO `transacciones` VALUES (257, 'MOV-0000257', '', '', '', '2021-11-25 20:27:55', 0.00, 0.00, 'MOVIMIENTO ANULADO', 0.00, 0.00, 'El primer producto tiene un defecto que lo deja inservible para facturar, están totalmente dañados, no es conveniente dejarlos en stock', NULL, 5, 'MOVIMIENTO', 0.00);
INSERT INTO `transacciones` VALUES (258, 'MOV-0000258', '', '', '', '2021-11-25 20:33:19', 0.00, 0.00, 'MOVIMIENTO', 0.00, 0.00, 'El primer producto tiene un defecto que lo deja inservible para facturar, están totalmente dañados, no es conveniente dejarlos en stock', NULL, 5, 'MOVIMIENTO', 0.00);
INSERT INTO `transacciones` VALUES (259, 'FAC-0000259', 'FACTURA', '000-001-00072001    ', '000-001-00065003    ', '2021-11-25 20:40:09', 902.02, 6915.52, 'FACTURADO', 0.00, 0.15, '', 53, 5, 'VENTA', 7000.00);
INSERT INTO `transacciones` VALUES (260, 'ING-0000260', 'FACTURA', '0000007', '0000007', '2021-11-25 20:40:53', 60077.92, 460597.42, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (261, 'ING-0000261', 'FACTURA', '0000008', '0000008', '2021-11-25 20:41:26', 63168.75, 484293.75, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (262, 'FAC-0000262', 'FACTURA', '000-001-00072001    ', '000-001-00065004    ', '2021-11-25 20:51:11', 595.05, 4558.90, 'FACTURADO', 3.15, 0.15, '', 57, 5, 'VENTA', 4600.00);
INSERT INTO `transacciones` VALUES (263, 'FAC-0000263', 'FACTURA', '000-001-00072001    ', '000-001-00065005    ', '2021-11-25 20:52:27', 5724.64, 43888.89, 'FACTURADO', 0.00, 0.15, '', 58, 5, 'VENTA', 45000.00);
INSERT INTO `transacciones` VALUES (264, 'FAC-0000264', 'FACTURA', '000-001-00072001    ', '000-001-00065006    ', '2021-11-25 20:52:55', 1960.78, 15032.68, 'FACTURADO', 0.00, 0.15, '', 51, 5, 'VENTA', 16000.00);
INSERT INTO `transacciones` VALUES (265, 'FAC-0000265', 'FACTURA', '000-001-00072001    ', '000-001-00065007    ', '2021-11-25 20:53:14', 201.00, 1541.00, 'FACTURADO', 0.00, 0.15, '', 54, 5, 'VENTA', 1600.00);
INSERT INTO `transacciones` VALUES (266, 'ORD-0000266', '', '', '', '2021-11-25 20:59:02', 1515.18, 11616.38, 'INICIADO', 0.00, 0.15, '', 59, 5, 'ORDEN', 0.00);
INSERT INTO `transacciones` VALUES (267, 'ORD-0000267', '', '', '', '2021-11-25 21:19:16', 981.20, 7522.52, 'INICIADO', 0.00, 0.15, '', 60, 5, 'ORDEN', 0.00);
INSERT INTO `transacciones` VALUES (268, 'ORD-0000268', '', '', '', '2021-11-25 22:46:38', 1197.35, 9179.65, 'INICIADO', 0.00, 0.15, '', 61, 5, 'ORDEN', 0.00);
INSERT INTO `transacciones` VALUES (269, 'COT-0000269', '', '', '', '2021-11-26 01:01:14', 1176.25, 8959.45, 'COTIZADO', 58.50, 0.15, '', 53, 34, 'COTIZACION', 0.00);
INSERT INTO `transacciones` VALUES (270, 'ING-0000270', 'FACTURA', '0000009', '0000009', '2021-11-26 01:08:18', 2904.54, 22268.14, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (271, 'AJT-0000271', 'AJUSTE', '0000010', '0000010', '2021-11-26 01:09:05', 522.30, 4004.30, 'AJUSTE ANULADO', 0.00, 0.15, '', NULL, 5, 'AJUSTE', 0.00);
INSERT INTO `transacciones` VALUES (272, 'ING-0000272', 'FACTURA', '0000010', '0000010', '2021-11-26 01:09:43', 0.00, 55712.00, 'INGRESADO', 0.00, 0.99, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (273, 'FAC-0000273', 'FACTURA', '000-001-00072001    ', '000-001-00065008    ', '2021-11-26 01:13:11', 2967.54, 22751.14, 'FACTURADO', 0.00, 0.15, '', 53, 5, 'VENTA', 22755.00);
INSERT INTO `transacciones` VALUES (274, 'COT-0000274', '', '', '', '2021-11-27 02:32:55', 499.50, 3829.50, 'COTIZADO', 0.00, 0.15, '', 1, 34, 'COTIZACION', 0.00);
INSERT INTO `transacciones` VALUES (275, 'COT-0000275', '', '', '', '2021-11-29 03:39:40', 499.50, 3829.50, 'COTIZADO', 0.00, 0.15, '', 60, 34, 'COTIZACION', 0.00);
INSERT INTO `transacciones` VALUES (276, 'ORD-0000276', 'FACTURA', '000-001-00072001    ', '000-001-00065009    ', '2021-11-29 03:40:59', 384.52, 2887.52, 'ORDEN FACTURADA', 60.50, 0.15, '', 57, 34, 'ORDEN', 3000.00);
INSERT INTO `transacciones` VALUES (277, 'ING-0000277', 'FACTURA', '0000011', '0000011', '2021-11-29 13:34:57', 13389.75, 102654.75, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (278, 'ING-0000278', 'FACTURA', '0000012', '0000012', '2021-11-29 13:35:41', 1314.60, 10078.60, 'ANULADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (279, 'FAC-0000279', 'FACTURA', '000-001-00072001    ', '000-001-00065009    ', '2021-11-29 13:45:03', 1277.47, 9791.87, 'FACTURADO', 2.10, 0.15, '', 66, 5, 'VENTA', 9850.50);
INSERT INTO `transacciones` VALUES (280, 'COT-0000280', '', '', '', '2021-11-29 21:46:08', 44205.07, 338905.52, 'COTIZADO', 0.00, 0.15, '', 1, 34, 'COTIZACION', 0.00);
INSERT INTO `transacciones` VALUES (281, 'ING-0000281', 'FACTURA', '0000013', '0000013', '2021-11-29 21:58:02', 3045.00, 23345.00, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);
INSERT INTO `transacciones` VALUES (282, 'ING-0000282', 'FACTURA', '0000014', '0000014', '2021-11-29 22:04:03', 3495.00, 26795.00, 'INGRESADO', 0.00, 0.15, '', NULL, 5, 'INGRESO', 0.00);

-- ----------------------------
-- Table structure for unidad_medida
-- ----------------------------
DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE `unidad_medida`  (
  `unidad_id` int NOT NULL AUTO_INCREMENT,
  `unidad_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `unidad_abreviatura` char(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `unidad_fregistro` date NULL DEFAULT NULL,
  `unidad_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`unidad_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of unidad_medida
-- ----------------------------
INSERT INTO `unidad_medida` VALUES (1, 'KILO', 'KL', '2021-09-27', 'ACTIVO');
INSERT INTO `unidad_medida` VALUES (2, 'MINILITROS', 'MN', '2021-09-27', 'ACTIVO');
INSERT INTO `unidad_medida` VALUES (3, 'LITROS', 'L', '2021-09-27', 'ACTIVO');
INSERT INTO `unidad_medida` VALUES (4, 'MILILITROS', 'MLL', '2021-09-27', 'ACTIVO');
INSERT INTO `unidad_medida` VALUES (5, 'Unidad', 'Ud', '2021-10-08', 'ACTIVO');
INSERT INTO `unidad_medida` VALUES (6, 'KILOGRAMO', 'KG', '2021-11-26', 'ACTIVO');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario_password` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario_intento` int NOT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rol_id` int NOT NULL DEFAULT 0,
  `usuario_imagen` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `persona_id` int NULL DEFAULT NULL,
  `usuario_tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT 'USUARIO',
  `usuario_passwordtemp` int NULL DEFAULT 0,
  PRIMARY KEY (`usuario_id`) USING BTREE,
  UNIQUE INDEX `usuario_nombre`(`usuario_nombre`) USING BTREE,
  INDEX `FK_USUARIO_ROL`(`rol_id`) USING BTREE,
  INDEX `FK_USUARIO_PERSONA`(`persona_id`) USING BTREE,
  CONSTRAINT `FK_USUARIO_PERSONA` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USUARIO_ROL` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (4, 'admin', '$2y$10$hw3VM6c9.vVezW6LANsjXOqOcBI0wKtCjW9.zaSMO9c5i6nk19tjq', 1, 'ACTIVO', 1, 'controlador/usuario/img/user_default.png', 2, 'USUARIO', 1);
INSERT INTO `usuario` VALUES (5, 'bAlvarez01', '$2y$10$7XdB.VeWo/O5wfSSUGGcAOGShwA3AEzQHlZ8SdmCsj9ejUBTf5VnG', 1, 'ACTIVO', 1, 'controlador/usuario/img/user_default.png', 1, 'USUARIO', 0);
INSERT INTO `usuario` VALUES (34, 'emanuel', '$2y$10$YKNIZBr60yI4VXQ2/BJ3P.PGTg3vnqoqJZ.N4S/gvdGpK5Ov57JdS', 1, 'ACTIVO', 1, 'controlador/usuario/img/user_default.png', 51, 'USUARIO', 0);
INSERT INTO `usuario` VALUES (35, 'marlon01', '$2y$10$FCfbluQgTeJPwm7lRSiMxu6aRZHpcIRVXd3GexlLWeSkMC9YioAa.', 1, 'ACTIVO', 14, 'controlador/usuario/img/user_default.png', 52, 'USUARIO', 0);
INSERT INTO `usuario` VALUES (36, 'artur01', '$2y$10$bPY4SsL4MU9YZeKuP7Eueu5TjS.3jUfs0aFK45kocDFFQVO.IsnM2', 1, 'ACTIVO', 14, 'controlador/usuario/img/user_default.png', 56, 'USUARIO', 0);
INSERT INTO `usuario` VALUES (37, '1012198545203', '$2y$10$2xVp45ncoDjYvkTlbrZBROmxjz1lXkaMqLD7uRg8hxCKHAgGPiJCa', 1, 'ACTIVO', 16, 'controlador/usuario/img/user_default.png', 59, 'USUARIO', 0);
INSERT INTO `usuario` VALUES (38, '080510023569', '$2y$10$Pv1ILGCqJvUANCnNUydWy.9w61CIH4QqlDxD4O5AevSgGOVG8Fd3a', 1, 'ACTIVO', 16, 'controlador/usuario/img/user_default.png', 58, 'USUARIO', 0);
INSERT INTO `usuario` VALUES (39, 'MecanicoPrueba', '$2y$10$MrcaKg9EAkfOVVUKrZXKe.ySVTV8DOHNnn7R6LWx/T1hntB7iGDvC', 1, 'ACTIVO', 14, 'controlador/usuario/img/user_default.png', 62, 'USUARIO', 0);
INSERT INTO `usuario` VALUES (40, '080520001000656', '$2y$10$EfVv2qX.TzwptKDKu6loa.kC.DXnD77KmvkDs/P4VqkpQ4md1BeZy', 1, 'ACTIVO', 16, 'controlador/usuario/img/user_default.png', 66, 'USUARIO', 1);
INSERT INTO `usuario` VALUES (41, '08011999000256', '$2y$10$7/udHFlF4cYl495R8pJgDOYPReKK8G5zZHSJA0V8AXewrH4a423jW', 1, 'ACTIVO', 16, 'controlador/usuario/img/user_default.png', 65, 'USUARIO', 1);

-- ----------------------------
-- Table structure for vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE `vehiculo`  (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `vehiculo_placa` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `vehiculo_anio` year NULL DEFAULT NULL,
  `vehiculo_transmision` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `vehiculo_tipo_combustible` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `vehiculo_num_chasis` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `vehiculo_num_motor` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `vehiculo_observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL,
  `vehiculo_imagen` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `vehiculo_tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `vehiculo_estado` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_modelo` int NULL DEFAULT NULL,
  `id_cliente` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_vehiculo`) USING BTREE,
  INDEX `fk_vehiculo_modelo`(`id_modelo`) USING BTREE,
  INDEX `fk_vehiculo_cliente`(`id_cliente`) USING BTREE,
  CONSTRAINT `fk_vehiculo_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vehiculo_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vehiculo
-- ----------------------------
INSERT INTO `vehiculo` VALUES (11, 'HAB1245', 2015, 'MANUAL', 'GASOLINA', '12459845', '45856954', 'El auto tiene los vidrios polarizados, es de color rojo y presenta pegatina de rayos', 'controlador/vehiculo/img/vehiculo_default.png', 'LIVIANO', 'ACTIVO', 7, 23);
INSERT INTO `vehiculo` VALUES (12, 'JSD45785', 2014, 'MANUAL', 'GASOLINA', '458548759', '585482585', 'Esta es una descripcion', 'controlador/vehiculo/img/vehiculo_default.png', 'LIVIANO', 'ACTIVO', 12, 23);
INSERT INTO `vehiculo` VALUES (13, 'HN125006', 2018, 'AUTOMATICA', 'GASOLINA', 'ACD-80225F-RRG552', 'BDF-5885B-NOP7987', 'Automóvil de ultima generación', 'controlador/vehiculo/img/vehiculo_default.png', 'LIVIANO', 'ACTIVO', 8, 24);
INSERT INTO `vehiculo` VALUES (14, 'HN10050', 2018, 'MANUAL', 'GASOLINA', 'ADB4-DFG5666-HHJK654654', 'CHBN-052FV6-HHJK65400', 'Esta es una observacion', 'controlador/vehiculo/img/vehiculo_default.png', 'LIVIANO', 'ACTIVO', 11, 25);
INSERT INTO `vehiculo` VALUES (15, 'HN89071', 2020, 'MANUAL', 'GASOLINA', 'ADB4-DFG5666-HHJK654655', 'CHBN-072FV6-HHJK65400', 'Descripcion', 'controlador/vehiculo/img/vehiculo_default.png', 'LIVIANO', 'ACTIVO', 14, 26);
INSERT INTO `vehiculo` VALUES (16, 'HN-N2347', 2020, 'MANUAL', 'GASOLINA', 'ADB4-DFG866-HHJK654655', 'JFBS-052FV6-HHJK65401', 'Automovil', 'controlador/vehiculo/img/vehiculo_default.png', 'LIVIANO', 'ACTIVO', 15, 27);
INSERT INTO `vehiculo` VALUES (17, 'HAB1247', 2015, 'MANUAL', 'GASOLINA', '458548758', '5586894444', 'Esta es una descripcion', 'controlador/vehiculo/img/vehiculo_default.png', 'LIVIANO', 'ACTIVO', 11, 24);

-- ----------------------------
-- Procedure structure for SP_ACTUALIZAR_DATOS_PERSONA_PROFILE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_DATOS_PERSONA_PROFILE`;
delimiter ;;
CREATE PROCEDURE `SP_ACTUALIZAR_DATOS_PERSONA_PROFILE`(IN ID INT,
	IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17),
	IN CORREO VARCHAR(70))
BEGIN
	DECLARE DOCUMENTO_ACTUAL INT;
	DECLARE CANTIDAD INT;
	DECLARE ID_PERSONA INT;
	SET @ID_PERSONA:=(SELECT persona_id FROM usuario WHERE usuario_id = ID);
	SET @DOCUMENTO_ACTUAL:=(SELECT persona_nrodocumento FROM persona WHERE persona_id = @ID_PERSONA);
	
	IF @DOCUMENTO_ACTUAL = N_DOCUMENTO THEN
		UPDATE persona SET 
			persona_nombre = NOMBRE, 
			persona_apepat = APELLIDO_PATERNO, 
			persona_apmat = APELLIDO_MATERNO, 
			persona_tipodocumento = TIPO_DOCUMENTO, 
			persona_sexo = SEXO,
			persona_telefono = TELEFONO,
			persona_correo = CORREO
		WHERE persona_id = @ID_PERSONA;
		SELECT 1; #RETORNAMOS
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO OR persona_correo = CORREO);
		IF @CANTIDAD = 0 THEN
		UPDATE persona SET 
			persona_nombre = NOMBRE, 
			persona_apepat = APELLIDO_PATERNO, 
			persona_apmat = APELLIDO_MATERNO, 
			persona_nrodocumento = N_DOCUMENTO, 
			persona_tipodocumento = TIPO_DOCUMENTO, 
			persona_sexo = SEXO,
			persona_telefono = TELEFONO,
			persona_correo = CORREO
		WHERE persona_id = @ID_PERSONA;
		SELECT 1; #RETORNAMOS
	ELSE
		SELECT 2;
	END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ACTUALIZAR_PASSWORD_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_PASSWORD_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_ACTUALIZAR_PASSWORD_USUARIO`(IN ID INT, IN CONTRASENA VARCHAR(250), IN TEMPORAL INT)
UPDATE usuario set usuario_password = CONTRASENA, usuario_passwordtemp = TEMPORAL WHERE usuario_id = ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_AGREGAR_OFERTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_AGREGAR_OFERTA`;
delimiter ;;
CREATE PROCEDURE `SP_AGREGAR_OFERTA`(IN OFERTA INT, IN DESCUENTO DECIMAL(2,2), IN ID_PRODUCTO INT)
UPDATE producto SET producto_oferta = OFERTA, producto_descuento = DESCUENTO WHERE producto_id
 = ID_PRODUCTO
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ANULAR_INGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ANULAR_INGRESO`;
delimiter ;;
CREATE PROCEDURE `SP_ANULAR_INGRESO`(IN ID_INGRESO INT)
BEGIN
		DECLARE CANTIDAD INT;
	DECLARE ID_PRODUCTO INT;
	DECLARE STOCK_ACTUAL INT;
	DECLARE DETALLE_ID INT;
	
	UPDATE transacciones SET transaccion_estatus = 'ANULADO' WHERE transaccion_id = ID_INGRESO;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID_INGRESO);
	
	WHILE @CANTIDAD > 0 DO
		SET @ID_PRODUCTO:=(SELECT producto_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'INGRESADO' AND transaccion_id = ID_INGRESO LIMIT 1);
		
		SET @DETALLE_ID:=(SELECT detalletransaccion_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'INGRESADO' AND transaccion_id = ID_INGRESO LIMIT 1);
		
		SET @STOCK_ACTUAL:=(SELECT producto_stock FROM producto WHERE producto_id = @ID_PRODUCTO);
		
		UPDATE producto SET producto_stock = @STOCK_ACTUAL-(SELECT detalletransaccion_cantidad FROM detalle_transaccion WHERE detalletransaccion_estatus = 'INGRESADO' AND transaccion_id = ID_INGRESO LIMIT 1) WHERE producto_id = @ID_PRODUCTO;
		
		UPDATE detalle_transaccion SET detalletransaccion_estatus = 'ANULADO' WHERE detalletransaccion_id = @DETALLE_ID;
		SET @CANTIDAD:= @CANTIDAD - 1;
	END WHILE;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ANULAR_MOVIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ANULAR_MOVIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_ANULAR_MOVIMIENTO`(IN ID_TRANSACCION INT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE ID_PRODUCTO INT;
	DECLARE STOCK_ACTUAL INT;
	DECLARE DETALLE_ID INT;
	
	UPDATE transacciones SET transaccion_estatus = 'MOVIMIENTO ANULADO' WHERE transaccion_id = ID_TRANSACCION;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID_TRANSACCION);
	
	WHILE @CANTIDAD > 0 DO
		SET @ID_PRODUCTO:=(SELECT producto_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'MOVIMIENTO' AND transaccion_id = ID_TRANSACCION LIMIT 1);
		
		SET @DETALLE_ID:=(SELECT detalletransaccion_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'MOVIMIENTO' AND transaccion_id = ID_TRANSACCION LIMIT 1);
		
		SET @STOCK_ACTUAL:=(SELECT producto_stock FROM producto WHERE producto_id = @ID_PRODUCTO);
		
		UPDATE producto SET producto_stock = @STOCK_ACTUAL + (SELECT detalletransaccion_cantidad FROM detalle_transaccion WHERE detalletransaccion_estatus = 'MOVIMIENTO' AND transaccion_id = ID_TRANSACCION LIMIT 1) WHERE producto_id = @ID_PRODUCTO;
		
		UPDATE detalle_transaccion SET detalletransaccion_estatus = 'MOVIMIENTO ANULADO' WHERE detalletransaccion_id = @DETALLE_ID;
		SET @CANTIDAD:= @CANTIDAD - 1;
	END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ANULAR_ORDEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ANULAR_ORDEN`;
delimiter ;;
CREATE PROCEDURE `SP_ANULAR_ORDEN`(IN ID INT)
BEGIN
	UPDATE transacciones SET transaccion_estatus = 'ORDEN ANULADA'
	WHERE transaccion_id = ID;
	
	UPDATE detalle_transaccion SET detalle_transaccion.detalletransaccion_estatus = 'ORDEN ANULADA' 
	WHERE transaccion_id = ID;
	
	SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ANULAR_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ANULAR_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_ANULAR_VENTA`(IN ID_VENTA INT)
BEGIN
		DECLARE CANTIDAD INT;
	DECLARE ID_PRODUCTO INT;
	DECLARE STOCK_ACTUAL INT;
	DECLARE DETALLE_ID INT;
	
	UPDATE transacciones SET transaccion_estatus = 'VENTA ANULADA' WHERE transaccion_id = ID_VENTA;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID_VENTA);
	
	WHILE @CANTIDAD > 0 DO
		SET @ID_PRODUCTO:=(SELECT producto_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'FACTURADO' AND transaccion_id = ID_VENTA LIMIT 1);
		
		SET @DETALLE_ID:=(SELECT detalletransaccion_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'FACTURADO' AND transaccion_id = ID_VENTA LIMIT 1);
		
		SET @STOCK_ACTUAL:=(SELECT producto_stock FROM producto WHERE producto_id = @ID_PRODUCTO);
		
		UPDATE producto SET producto_stock = @STOCK_ACTUAL + (SELECT detalletransaccion_cantidad FROM detalle_transaccion WHERE detalletransaccion_estatus = 'FACTURADO' AND transaccion_id = ID_VENTA LIMIT 1) WHERE producto_id = @ID_PRODUCTO;
		
		UPDATE detalle_transaccion SET detalletransaccion_estatus = 'VENTA ANULADA' WHERE detalletransaccion_id = @DETALLE_ID;
		SET @CANTIDAD:= @CANTIDAD - 1;
	END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_COMP_DET_ORDEN_ELIM
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_COMP_DET_ORDEN_ELIM`;
delimiter ;;
CREATE PROCEDURE `SP_COMP_DET_ORDEN_ELIM`(IN ID INT)
BEGIN
	SELECT 
	COUNT(tarea.detalletransaccion_id) as cuenta
FROM detalle_transaccion INNER JOIN tarea ON detalle_transaccion.detalletransaccion_id = tarea.detalletransaccion_id
WHERE detalle_transaccion.detalletransaccion_id = ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_COMP_ORDEN_FINALIZADA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_COMP_ORDEN_FINALIZADA`;
delimiter ;;
CREATE PROCEDURE `SP_COMP_ORDEN_FINALIZADA`(IN ID INT)
BEGIN
	SELECT
	COUNT(*)
	FROM (SELECT 
					dt.detalletransaccion_id,
					IFNULL(t.estado, "PENDIENTE") as estado
				FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id 
																		LEFT JOIN tarea t ON dt.detalletransaccion_id = t.detalletransaccion_id 
				WHERE dt.transaccion_id = ID
				AND p.prod_serv_tipo = "SERVICIO") as t
				WHERE t.estado = "PENDIENTE";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_ACCESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_ACCESO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_ACCESO`(IN USUARIO INT,
	IN MODULO VARCHAR(100))
BEGIN
		DECLARE ESTADO VARCHAR(50);
		
		SELECT
		 acceso_estado 
		 INTO ESTADO
		FROM acceso 
			WHERE modulo_codigo = MODULO 
			AND usuario_id = USUARIO;
		
		IF ESTADO = 'ACTIVO' THEN
			
			SET	ESTADO = 'INACTIVO';
		
		ELSE  
		 SET	ESTADO = 'ACTIVO';
		END IF;
		
		UPDATE acceso SET acceso_estado = ESTADO WHERE modulo_codigo = MODULO 
			AND usuario_id = USUARIO;
		#INSERT INTO bitacora_marca (accion, fecha_hora, descripcion) VALUES('GUARDAR', NOW(), CONCAT_WS(' ','El usuario con id:', CONVERT(ID_USUARIO_GUARDA,CHAR), 'guardo la marca', NOMBRE));
		SELECT 1; #RETORNAMOS EL CUAL SE GUARDO
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_CATEGORIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_CATEGORIA`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_CATEGORIA`(IN ID INT, IN CATEGORIA_ACTUAL VARCHAR(25), IN CATEGORIA_NUEVO VARCHAR(25), IN ESTATUS VARCHAR(10))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_REG INT;
	
	IF ESTATUS = 'INACTIVO' THEN
		SET @CANTIDAD_REG:=(SELECT COUNT(*) FROM producto WHERE categoria_id = ID);
		IF @CANTIDAD_REG = 0 THEN
			IF CATEGORIA_ACTUAL = CATEGORIA_NUEVO THEN
				UPDATE categoria SET categoria_estatus = ESTATUS WHERE categoria_id = ID;
				SELECT 1; #RETORNAMOS
			ELSE
				SET @CANTIDAD := (SELECT COUNT(*) FROM categoria WHERE categoria_nombre = CATEGORIA_NUEVO);
				
				IF @CANTIDAD = 0 THEN 
					UPDATE categoria SET categoria_nombre = CATEGORIA_NUEVO, categoria_estatus = ESTATUS WHERE categoria_id = ID;
					SELECT 1; #RETORNAMOS
				ELSE 
					SELECT 2; #RETORNAMOS
				END IF;
			END IF;
		ELSE
			SELECT 3;
		END IF;

	ELSE
	
		IF CATEGORIA_ACTUAL = CATEGORIA_NUEVO THEN
			UPDATE categoria SET categoria_estatus = ESTATUS WHERE categoria_id = ID;
			SELECT 1; #RETORNAMOS
		ELSE
			SET @CANTIDAD := (SELECT COUNT(*) FROM categoria WHERE categoria_nombre = CATEGORIA_NUEVO);
			
			IF @CANTIDAD = 0 THEN 
				UPDATE categoria SET categoria_nombre = CATEGORIA_NUEVO, categoria_estatus = ESTATUS WHERE categoria_id = ID;
				SELECT 1; #RETORNAMOS
			ELSE 
				SELECT 2; #RETORNAMOS
			END IF;
		END IF;
	END IF;
		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_CLIENTE`(IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN CORREO VARCHAR(70),
	IN N_DOCUMENTO VARCHAR(17),
	IN TELEFONO VARCHAR(17),
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN SEXO VARCHAR(15),
	IN ID_PERSONA INT,
	IN EMPRESA VARCHAR(100))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_CORREO INT;
	DECLARE RTN_ACTUAL VARCHAR(17);
	DECLARE CORREO_ACTUAL VARCHAR(17);
	
	SET @RTN_ACTUAL:=(SELECT persona_nrodocumento FROM persona WHERE persona_id = ID_PERSONA);
	SET @CORREO_ACTUAL:=(SELECT persona_correo FROM persona WHERE persona_id = ID_PERSONA);
	
			IF @RTN_ACTUAL = N_DOCUMENTO OR @CORREO_ACTUAL = CORREO THEN 
			
				IF @CORREO_ACTUAL = CORREO AND @RTN_ACTUAL = N_DOCUMENTO THEN 
							
						UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO, persona_telefono = TELEFONO, persona_sexo = SEXO, persona_empresa = EMPRESA WHERE persona_id = ID_PERSONA;
						SELECT 1;

				ELSE #ELSE DEL SEGUNDO IF
					SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
					SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
					
					IF @RTN_ACTUAL = N_DOCUMENTO THEN #TERCER IF
							IF @CANTIDAD_CORREO = 0 THEN #CUARTO IF
									UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO	, persona_correo = CORREO, persona_telefono = TELEFONO, persona_sexo = SEXO, persona_empresa = EMPRESA WHERE persona_id = ID_PERSONA;
								 SELECT 1;
									
							ELSE #ELSE CUARTO IF
							
								SELECT 3;
								
							END IF; #END IF DEL CUARTO IF
							
					ELSE #ELSE TERCER IF
				
						IF @CORREO_ACTUAL = CORREO THEN #QUINTO IF
							IF @CANTIDAD = 0 THEN #SEXTO IF
									UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO	, persona_nrodocumento = N_DOCUMENTO, persona_telefono = TELEFONO, persona_sexo = SEXO, persona_empresa = EMPRESA WHERE persona_id = ID_PERSONA;
								 SELECT 1;
							ELSE # ELSE SEXTO IF
								SELECT 2;
							END IF; #END IF DEL SEXTO IF
						
						ELSE #ELSE DEL QUINTO IF 
							SELECT 4;
						
						END IF; #END IF DEL QUINTO IF 
					
					END IF; #END DEL TERCER IF
					
				END IF; #END IF DEL SEGUNDO IF
				
		
				
			ELSE #ELSE DEL IF PRINCIPAL
			
				SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
				SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
				
				IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
						
						UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO, persona_correo = CORREO, persona_nrodocumento = N_DOCUMENTO, persona_telefono = TELEFONO, persona_tipodocumento = TIPO_DOCUMENTO, persona_sexo = SEXO, persona_empresa = EMPRESA WHERE persona_id = ID_PERSONA;
						SELECT 1;
				ELSE
				
					IF @CANTIDAD > 0 THEN
						SELECT 2;
					ELSEIF @CANTIDAD_CORREO > 0 THEN
						SELECT 3;
					ELSE
						SELECT 4;
					END IF;
				
				END IF;
			
			END IF; #END IF DEL IF PRINCIPAL
  END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_CONFIGURACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_CONFIGURACION`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_CONFIGURACION`(IN ID_CONFIGURACION INT,
IN NOMBRE VARCHAR(255),
IN DIRECCION VARCHAR(255),
IN TELEFONO VARCHAR(20),
IN CELULAR VARCHAR(20),
IN RTN VARCHAR(100),
IN CORREO VARCHAR(100),
IN ISV DECIMAL(2,2),
IN CAI VARCHAR(255),
IN FECHALIMITE DATE,
IN CANTIDADFACTURA INT,
IN NUMERO_INICIAL VARCHAR(50),
IN NUMERO_FINAL VARCHAR(50),
IN PRECIO_DOLAR DECIMAL(5,2))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CONF_ACTUAL VARCHAR(255);
	SET @CONF_ACTUAL:=(SELECT conf_nombre_empresa FROM configuracion WHERE conf_id = ID_CONFIGURACION);
	
	IF @CONF_ACTUAL = NOMBRE THEN 
			UPDATE configuracion SET 
				conf_direccion = DIRECCION, 
				conf_telefono = TELEFONO, 
				conf_celular = CELULAR, 
				conf_rtn = RTN,
				conf_correo = CORREO,
				conf_isv = ISV,
				conf_cai = CAI,
				conf_fact_fechalimite_emision = FECHALIMITE,
				conf_cantidad_fact = CANTIDADFACTURA,
				conf_numero_inicial = NUMERO_INICIAL,
				conf_numero_final = NUMERO_FINAL,
				conf_preciodolar = PRECIO_DOLAR
			WHERE conf_id = ID_CONFIGURACION;
			SELECT 1;
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM configuracion WHERE conf_nombre_empresa = NOMBRE);
		
		IF @CANTIDAD = 0 THEN
			UPDATE configuracion SET conf_nombre_empresa = NOMBRE, 
				conf_direccion = DIRECCION, 
				conf_telefono = TELEFONO, 
				conf_celular = CELULAR, 
				conf_rtn = RTN,
				conf_correo = CORREO,
				conf_isv = ISV,
				conf_cai = CAI,
				conf_fact_fechalimite_emision = FECHALIMITE,
				conf_cantidad_fact = CANTIDADFACTURA,
				conf_numero_inicial = NUMERO_INICIAL,
				conf_numero_final = NUMERO_FINAL,
				conf_preciodolar = PRECIO_DOLAR
			WHERE conf_id = ID_CONFIGURACION;
			SELECT 1;
		ELSE 
			SELECT 2;
		END IF;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_CONFIGURACION_FOTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_CONFIGURACION_FOTO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_CONFIGURACION_FOTO`(IN ID INT,
IN IMAGEN VARCHAR(255))
BEGIN
	UPDATE configuracion SET conf_img_logo = IMAGEN WHERE conf_id = ID;
	SELECT 1; #RETORNAMOS
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_COTIZACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_COTIZACION`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_COTIZACION`(IN ID_COTIZACION INT,
IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN OBSER TEXT)
BEGIN
	
		UPDATE transacciones 
			SET persona_id = ID_CLIENTE,
					usuario_id = ID_USUARIO,
					transaccion_total = TOTAL,
					transaccion_impuesto = IMPUESTO,
					transaccion_porcentaje = PORCENTAJE,
					transaccion_descuento = DESCUENTO,
					transaccion_observaciones = OBSER,
					transaccion_fecha = NOW()
		WHERE transaccion_id = ID_COTIZACION;
		
		SELECT ID_COTIZACION;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_DETALLE_ORDEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_DETALLE_ORDEN`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_DETALLE_ORDEN`(IN TRANSACCION INT(11), 
IN VEHICULO INT(11),
IN COMBUSTIBLE VARCHAR(20), 
IN KILOMETRAJE VARCHAR(20), 
IN MECANICO INT(11),
IN OBSER TEXT)
BEGIN

 	UPDATE transaccion_vehiculo SET 
		nivel_combustible = COMBUSTIBLE, 
		`vehiculo_km/millas` = KILOMETRAJE, 
		id_usuario = MECANICO, 
		descripcion = OBSER
 	WHERE id_transaccion = TRANSACCION;
		
	SELECT TRANSACCION;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_ESTATUS_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_ESTATUS_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_ESTATUS_CLIENTE`(IN ID_CLIENTE INT,IN ESTATUS VARCHAR(10))
UPDATE cliente SET cliente_estatus = ESTATUS WHERE cliente_id = ID_CLIENTE
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_ESTATUS_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_ESTATUS_PERSONA`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_ESTATUS_PERSONA`(IN ID_PERSONA INT,IN ESTATUS VARCHAR(10))
UPDATE persona SET persona_estatus = ESTATUS WHERE persona_id = ID_PERSONA
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_ESTATUS_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_ESTATUS_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_ESTATUS_PROVEEDOR`(IN ID_PROVEEDOR INT,IN ESTATUS VARCHAR(10))
UPDATE proveedor SET proveedor_estatus = ESTATUS WHERE proveedor_id = ID_PROVEEDOR
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_FABRICANTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_FABRICANTE`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_FABRICANTE`(IN ID INT, 
	IN FABRICANTE_ACTUAL VARCHAR(80), 
	IN FABRICANTE_NUEVO VARCHAR(80), 
	IN ESTATUS VARCHAR(10), 
	IN DESCRIPCION TEXT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_REG INT;
	
	IF ESTATUS = 'INACTIVO' THEN
		SET @CANTIDAD_REG:=(SELECT COUNT(*) FROM producto WHERE id_fabricante = ID);
		IF @CANTIDAD_REG = 0 THEN
			IF FABRICANTE_ACTUAL = FABRICANTE_NUEVO THEN
		UPDATE fabricante SET fabricante_estado = ESTATUS, fabricante_descripcion = DESCRIPCION WHERE id_fabricante = ID;
		SELECT 1; #RETORNAMOS
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM fabricante WHERE fabricante_nombre = FABRICANTE_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE fabricante SET fabricante_nombre = FABRICANTE_NUEVO, fabricante_descripcion = ESTATUS, fabricante_descripcion = DESCRIPCION WHERE 				id_fabricante = ID;
			SELECT 1; #RETORNAMOS
		ELSE 
			SELECT 2; #RETORNAMOS
		END IF;
	END IF;		
		ELSE
			SELECT 3;
		END IF;

		
	ELSE
		
		IF FABRICANTE_ACTUAL = FABRICANTE_NUEVO THEN
			UPDATE fabricante SET fabricante_estado = ESTATUS, fabricante_descripcion = DESCRIPCION WHERE id_fabricante = ID;
			SELECT 1; #RETORNAMOS
		ELSE
			SET @CANTIDAD := (SELECT COUNT(*) FROM fabricante WHERE fabricante_nombre = FABRICANTE_NUEVO);
			
			IF @CANTIDAD = 0 THEN 
				UPDATE fabricante SET fabricante_nombre = FABRICANTE_NUEVO, fabricante_descripcion = ESTATUS, fabricante_descripcion = DESCRIPCION WHERE 			id_fabricante = ID;
				SELECT 1; #RETORNAMOS
			ELSE 
				SELECT 2; #RETORNAMOS
			END IF;
		END IF;		
		
		
	END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_MARCA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_MARCA`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_MARCA`(IN ID_USUARIO_CAMBIO INT,
		IN ID INT, 
		IN MARCA_ACTUAL VARCHAR(45), 
		IN MARCA_NUEVO VARCHAR(45), 
		IN ESTADO VARCHAR(20), 
		IN DESCRIPCION TEXT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_REG INT;
	
	IF ESTADO = 'INACTIVO' THEN
		SET @CANTIDAD_REG:=(SELECT COUNT(*) FROM modelo WHERE id_marca = ID);
		IF @CANTIDAD_REG = 0 THEN
		
			IF MARCA_ACTUAL = MARCA_NUEVO THEN
		UPDATE marca SET marca_estado = ESTADO, marca_descripcion = DESCRIPCION WHERE id_marca = ID;
		INSERT INTO bitacora_marca (accion, fecha_hora, descripcion) VALUES('EDITAR', NOW(), CONCAT_WS(' ','El usuario con id:', CONVERT(ID_USUARIO_CAMBIO,CHAR), 'edito datos de la marca', MARCA_ACTUAL,'-', ID));
		SELECT 1; #RETORNAMOS
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM marca WHERE marca_nombre = MARCA_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE marca SET marca_nombre = MARCA_NUEVO, marca_descripcion = DESCRIPCION, marca_estado = ESTADO WHERE id_marca = ID;
			
			SELECT 1; #RETORNAMOS
		ELSE 
			SELECT 2; #RETORNAMOS
		END IF;
	END IF;
	
		ELSE
			SELECT 3;
	END IF;

	ELSE
	#NORMAL
		IF MARCA_ACTUAL = MARCA_NUEVO THEN
		UPDATE marca SET marca_estado = ESTADO, marca_descripcion = DESCRIPCION WHERE id_marca = ID;
		INSERT INTO bitacora_marca (accion, fecha_hora, descripcion) VALUES('EDITAR', NOW(), CONCAT_WS(' ','El usuario con id:', CONVERT(    ID_USUARIO_CAMBIO,CHAR), 'edito datos de la marca', MARCA_ACTUAL,'-', ID));
		SELECT 1; #RETORNAMOS
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM marca WHERE marca_nombre = MARCA_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE marca SET marca_nombre = MARCA_NUEVO, marca_descripcion = DESCRIPCION, marca_estado = ESTADO WHERE id_marca = ID;
			
			SELECT 1; #RETORNAMOS
		ELSE 
			SELECT 2; #RETORNAMOS
		END IF;
END IF;
	END IF;
		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_MODELO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_MODELO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_MODELO`(IN ID_USUARIOG INT,
	IN ID_MODEL INT, 
	IN MODELO_ACTUAL VARCHAR(80), 
	IN MODELO_NUEVO VARCHAR(80), 
	IN ESTATUS VARCHAR(45),
	IN DESCRIPCION TEXT,
	IN ID_MARCA INT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANT INT;
	
	SET	@CANT :=(SELECT COUNT(*) FROM modelo INNER JOIN vehiculo ON modelo.id_modelo = vehiculo.id_modelo WHERE modelo.id_modelo  = ID_MODEL); 
	
	IF @CANT>0 THEN
		SELECT 3;
	END IF;
	
	IF MODELO_ACTUAL = MODELO_NUEVO THEN
		UPDATE modelo SET modelo_estado=ESTATUS, modelo_descripcion=DESCRIPCION, id_marca=ID_MARCA WHERE id_modelo=ID_MODEL;
		SELECT 1; #RETORNAMOS
		
		#SELECT ID_MODELO;
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM modelo WHERE modelo_nombre = MODELO_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE modelo SET modelo_nombre = MODELO_NUEVO, modelo_estado = ESTATUS, modelo_descripcion = DESCRIPCION, id_marca = ID_MARCA WHERE id_modelo =ID_MODEL;
			SELECT 1; #RETORNAMOS
		ELSE 
			SELECT 2; #RETORNAMOS
		END IF;
END IF;		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_MOVIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_MOVIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_MOVIMIENTO`(IN OBSERVACION TEXT,
	IN ID_USUARIO INT,
	IN ID_TRANSACCION INT)
BEGIN
	UPDATE transacciones SET transaccion_observaciones = OBSERVACION, usuario_id = ID_USUARIO, transaccion_estatus = 'MOVIMIENTO' WHERE transaccion_id = ID_TRANSACCION;
	
	SELECT ID_TRANSACCION;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_ORDEN_TRABAJO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_ORDEN_TRABAJO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_ORDEN_TRABAJO`(IN ID_ORD INT, 
IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN OBSER TEXT)
BEGIN

	UPDATE transacciones SET
		persona_id = ID_CLIENTE, 
		usuario_id = ID_USUARIO,  
		transaccion_impuesto = IMPUESTO, 
		transaccion_total = TOTAL,  
		transaccion_porcentaje = PORCENTAJE,
		transaccion_descuento = DESCUENTO, 
		transaccion_observaciones = OBSER
	WHERE transaccion_id = ID_ORD;

	SELECT ID_ORD;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_PERSONA`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_PERSONA`(IN ID_PERSONA INT, 
	IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO_A VARCHAR(17),
	IN N_DOCUMENTO_N VARCHAR(17),	
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17),
	IN ESTATUS VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;

IF N_DOCUMENTO_A = N_DOCUMENTO_N THEN
	UPDATE persona SET persona_nombre = NOMBRE, 
		persona_apepat = APELLIDO_PATERNO, 
		persona_apmat = APELLIDO_MATERNO, 
		persona_tipodocumento = TIPO_DOCUMENTO, 
		persona_sexo = SEXO,
		persona_telefono = TELEFONO, 
		persona_estatus = ESTATUS
	WHERE persona_id = ID_PERSONA;	
	SELECT 1; #RETORNAMOS
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO_N);
	IF @CANTIDAD = 0 THEN
		UPDATE persona SET persona_nombre = NOMBRE, 
			persona_apepat = APELLIDO_PATERNO, 
			persona_apmat = APELLIDO_MATERNO, 
			persona_tipodocumento = TIPO_DOCUMENTO, 
			persona_nrodocumento = N_DOCUMENTO_N,
			persona_sexo = SEXO,
			persona_telefono = TELEFONO, 
			persona_estatus = ESTATUS
		WHERE persona_id = ID_PERSONA;
		SELECT 1; #RETORNAMOS
	ELSE
		SELECT 2; #RETORNAMOS
	END IF;

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_PRODUCTO`(IN ID_PRODUCTO INT,
IN PRODUCTO VARCHAR(150),
IN CATEGORIA INT, 
IN UNIDAD INT,
IN PRECIO DECIMAL(10,2),
IN ESTATUS VARCHAR(12),
IN DESCRIPCION VARCHAR(255),
IN PRECIO_COMPRA DECIMAL(10,2),
IN STOCK_MINIMO INT,
IN ID_FABRICANTE INT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE PRODUCTO_ACTUAL VARCHAR(150);
	SET @PRODUCTO_ACTUAL:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	
	IF @PRODUCTO_ACTUAL = PRODUCTO THEN 
			UPDATE producto SET 
				categoria_id = CATEGORIA, 
				unidad_id = UNIDAD, 
				producto_precioventa = PRECIO, 
				producto_estatus = ESTATUS,
				producto_descripcion = DESCRIPCION,
				id_fabricante = ID_FABRICANTE,
				producto_preciocompra = PRECIO_COMPRA,
				producto_stock_minimo = STOCK_MINIMO
			WHERE producto_id = ID_PRODUCTO;
			SELECT 1;
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_nombre = PRODUCTO);
		
		IF @CANTIDAD = 0 THEN
			UPDATE producto SET producto_nombre = PRODUCTO, 
				categoria_id = CATEGORIA, 
				unidad_id = UNIDAD, 
				producto_precioventa = PRECIO, 
				producto_estatus = ESTATUS,
				producto_descripcion = DESCRIPCION,
				id_fabricante = ID_FABRICANTE,
				producto_preciocompra = PRECIO_COMPRA,
				producto_stock_minimo = STOCK_MINIMO
			WHERE producto_id = ID_PRODUCTO;
			SELECT 1;
		ELSE 
			SELECT 2;
		END IF;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_PRODUCTO_FOTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_PRODUCTO_FOTO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_PRODUCTO_FOTO`(IN ID INT, IN IMAGEN VARCHAR(250))
BEGIN
	UPDATE producto SET producto_foto = IMAGEN WHERE producto_id = ID;
	SELECT 1; #RETORNAMOS
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_PROVEEDOR`(IN ID_PROVEEDOR INT, 
	IN RAZON_SOCIAL VARCHAR(255), 
	IN NOMBRE_CONTACTO VARCHAR(100),
	IN NUM_CONTACTO VARCHAR(17),

	IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN CORREO VARCHAR(70),
	IN N_DOCUMENTO VARCHAR(17),
	IN TELEFONO VARCHAR(17),
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN SEXO VARCHAR(15),
	IN ID_PERSONA INT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_CORREO INT;
	DECLARE RTN_ACTUAL VARCHAR(17);
	DECLARE CORREO_ACTUAL VARCHAR(17);
	
	SET @RTN_ACTUAL:=(SELECT persona_nrodocumento FROM persona WHERE persona_id = ID_PERSONA);
	SET @CORREO_ACTUAL:=(SELECT persona_correo FROM persona WHERE persona_id = ID_PERSONA);
	
			IF @RTN_ACTUAL = N_DOCUMENTO OR @CORREO_ACTUAL = CORREO THEN 
			
				IF @CORREO_ACTUAL = CORREO AND @RTN_ACTUAL = N_DOCUMENTO THEN 
							
						UPDATE proveedor SET proveedor_razonsocial = RAZON_SOCIAL, proveedor_contacto = NOMBRE_CONTACTO, proveedor_numcontacto = 						NUM_CONTACTO WHERE proveedor_id = ID_PROVEEDOR;
						UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO, 							persona_telefono = TELEFONO, persona_sexo = SEXO WHERE persona_id = ID_PERSONA;
						SELECT 1;

				ELSE #ELSE DEL SEGUNDO IF
					SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
					SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
					
					IF @RTN_ACTUAL = N_DOCUMENTO THEN #TERCER IF
							IF @CANTIDAD_CORREO = 0 THEN #CUARTO IF
									UPDATE proveedor SET proveedor_razonsocial = RAZON_SOCIAL, proveedor_contacto = NOMBRE_CONTACTO, 											proveedor_numcontacto = NUM_CONTACTO WHERE proveedor_id = ID_PROVEEDOR;
									UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO	, 								persona_correo = CORREO, persona_telefono = TELEFONO, persona_sexo = SEXO WHERE persona_id = ID_PERSONA;
								 SELECT 1;
									
							ELSE #ELSE CUARTO IF
							
								SELECT 3;
								
							END IF; #END IF DEL CUARTO IF
							
					ELSE #ELSE TERCER IF
				
						IF @CORREO_ACTUAL = CORREO THEN #QUINTO IF
							IF @CANTIDAD = 0 THEN #SEXTO IF
									UPDATE proveedor SET proveedor_razonsocial = RAZON_SOCIAL, proveedor_contacto = NOMBRE_CONTACTO, 											proveedor_numcontacto = NUM_CONTACTO WHERE proveedor_id = ID_PROVEEDOR;
									UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO	, 								persona_nrodocumento = N_DOCUMENTO, persona_telefono = TELEFONO, persona_sexo = SEXO WHERE persona_id = ID_PERSONA;
								 SELECT 1;
							ELSE # ELSE SEXTO IF
								SELECT 2;
							END IF; #END IF DEL SEXTO IF
						
						ELSE #ELSE DEL QUINTO IF 
							SELECT 4;
						
						END IF; #END IF DEL QUINTO IF 
					
					END IF; #END DEL TERCER IF
					
				END IF; #END IF DEL SEGUNDO IF
				
		
				
			ELSE #ELSE DEL IF PRINCIPAL
			
				SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
				SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
				
				IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
				
						UPDATE proveedor SET proveedor_razonsocial = RAZON_SOCIAL, proveedor_contacto = NOMBRE_CONTACTO, proveedor_numcontacto = 						NUM_CONTACTO WHERE proveedor_id = ID_PROVEEDOR;
						
						UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO, 						persona_correo = CORREO, persona_nrodocumento = N_DOCUMENTO, persona_telefono = TELEFONO, persona_tipodocumento = 					TIPO_DOCUMENTO, persona_sexo = SEXO WHERE persona_id = ID_PERSONA;
						SELECT 1;
				ELSE
				
					IF @CANTIDAD > 0 THEN
						SELECT 2;
					ELSEIF @CANTIDAD_CORREO > 0 THEN
						SELECT 3;
					ELSE
						SELECT 4;
					END IF;
				
				END IF;
			
			END IF; #END IF DEL IF PRINCIPAL
  END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_ROL`(IN ID INT, IN ROL_ACTUAL VARCHAR(25), IN ROL_NUEVO VARCHAR(25), IN ESTATUS VARCHAR(10))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANT INT;
	
	SET	@CANT :=(SELECT COUNT(*) FROM rol INNER JOIN usuario ON rol.rol_id = usuario.rol_id WHERE rol.rol_id  = ID); 
	
	IF @CANT>0 THEN
		SELECT 3;
	END IF;
		
	
	IF ROL_ACTUAL = ROL_NUEVO THEN
		UPDATE rol SET rol_estatus = ESTATUS WHERE rol_id = ID;
		SELECT 1; #RETORNAMOS
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM rol WHERE rol_nombre = ROL_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE rol SET rol_nombre = ROL_NUEVO, rol_estatus = ESTATUS WHERE rol_id = ID;
			SELECT 1; #RETORNAMOS
		ELSE 
			SELECT 2; #RETORNAMOS
		END IF;
		
	END IF;	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_SERVICIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_SERVICIO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_SERVICIO`(IN ID_PRODUCTO INT,
IN SERVICIO VARCHAR(150),
IN CATEGORIA INT, 
IN PRECIO DECIMAL(10,2),
IN ESTATUS VARCHAR(12),
IN DESCRIPCION VARCHAR(255))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE PRODUCTO_ACTUAL VARCHAR(150);
	SET @PRODUCTO_ACTUAL:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	
	IF @PRODUCTO_ACTUAL = SERVICIO THEN 
			UPDATE producto SET 
				categoria_id = CATEGORIA, 
				producto_precioventa = PRECIO, 
				producto_estatus = ESTATUS,
				producto_descripcion = DESCRIPCION
			WHERE producto_id = ID_PRODUCTO;
			SELECT 1;
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_nombre = SERVICIO);
		
		IF @CANTIDAD = 0 THEN
			UPDATE producto SET producto_nombre = SERVICIO, 
				categoria_id = CATEGORIA, 
				producto_precioventa = PRECIO, 
				producto_estatus = ESTATUS,
				producto_descripcion = DESCRIPCION
			WHERE producto_id = ID_PRODUCTO;
			SELECT 1;
		ELSE 
			SELECT 2;
		END IF;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_TAREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_TAREA`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_TAREA`(IN ID INT, IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
BEGIN
	UPDATE tarea t SET t.fecha_inicio = FECHA_INICIO, t.fecha_fin = FECHA_FIN WHERE t.id_tarea = ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_TAREA_IND
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_TAREA_IND`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_TAREA_IND`(IN ID INT, IN DESCRIPCION TEXT, IN ESTADO VARCHAR(20), IN ID_USUARIO INT)
UPDATE tarea t SET t.tarea_notas = DESCRIPCION, t.estado = ESTADO, t.usuario_id = ID_USUARIO WHERE t.id_tarea = ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_UNIDAD_MEDIDA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_UNIDAD_MEDIDA`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_UNIDAD_MEDIDA`(IN ID INT, IN UNIDAD_ACTUAL VARCHAR(100), IN UNIDAD_NUEVO VARCHAR(100), IN ABREVIATURA CHAR(10), IN ESTATUS VARCHAR(10))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANT INT;

	IF ESTATUS = 'INACTIVO' THEN
		SET	@CANT :=(SELECT COUNT(*) FROM unidad_medida INNER JOIN producto ON unidad_medida.unidad_id = producto.unidad_id WHERE unidad_medida.unidad_id = ID); 
		IF @CANT = 0 THEN
			IF UNIDAD_ACTUAL = UNIDAD_NUEVO THEN
				UPDATE unidad_medida SET unidad_abreviatura = ABREVIATURA, unidad_estatus = ESTATUS WHERE unidad_id = ID;
				SELECT 1; #RETORNAMOS
			ELSE
				SET @CANTIDAD := (SELECT COUNT(*) FROM unidad_medida WHERE unidad_nombre = UNIDAD_NUEVO);
				
				IF @CANTIDAD = 0 THEN 
					UPDATE unidad_medida SET unidad_nombre = UNIDAD_NUEVO, unidad_abreviatura = ABREVIATURA, unidad_estatus = ESTATUS WHERE 					unidad_id = ID;
					SELECT 1; #RETORNAMOS
				ELSE 
					SELECT 2; #RETORNAMOS
				END IF;
			END IF;	
				
		ELSE
			SELECT 3;
		END IF;
		
	ELSE
		IF UNIDAD_ACTUAL = UNIDAD_NUEVO THEN
			UPDATE unidad_medida SET unidad_abreviatura = ABREVIATURA, unidad_estatus = ESTATUS WHERE unidad_id = ID;
			SELECT 1; #RETORNAMOS
		ELSE
			SET @CANTIDAD := (SELECT COUNT(*) FROM unidad_medida WHERE unidad_nombre = UNIDAD_NUEVO);
			
			IF @CANTIDAD = 0 THEN 
				UPDATE unidad_medida SET unidad_nombre = UNIDAD_NUEVO, unidad_abreviatura = ABREVIATURA, unidad_estatus = ESTATUS WHERE 				unidad_id = ID;
				SELECT 1; #RETORNAMOS
			ELSE 
				SELECT 2; #RETORNAMOS
			END IF;
		END IF;	
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_USUARIO`(IN ID INT,
	IN ID_PERSONA INT,
	IN ID_ROL INT,
	IN ESTATUS VARCHAR(15))
BEGIN
	UPDATE usuario SET persona_id = ID_PERSONA, rol_id = ID_ROL, usuario_estatus = ESTATUS WHERE usuario_id = ID;
	SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_USUARIO_FOTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_USUARIO_FOTO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_USUARIO_FOTO`(IN ID INT, IN IMAGEN VARCHAR(250))
BEGIN
	UPDATE usuario SET usuario_imagen = IMAGEN WHERE usuario_id = ID;
	SELECT 1; #RETORNAMOS
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_VEHICULO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_VEHICULO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_VEHICULO`(IN ID_VEHI INT,
IN PLACA_NUEVA VARCHAR(50),
IN PLACA_ACTUAL VARCHAR(50),
IN ANIO VARCHAR(4),
IN TRANSMISION VARCHAR(50),
IN COMBUSTIBLE VARCHAR(50),
IN CHASIS VARCHAR(100),
IN MOTOR VARCHAR(50),
IN OBSERVACIONES TEXT,
IN TIPO VARCHAR(50),
IN ESTADO VARCHAR(50),
IN MODELO INT,
IN CLIENTE INT)
BEGIN
	DECLARE CANTIDAD INT;
	#DECLARE PRODUCTO_ACTUAL VARCHAR(150);
	
	#SET @PRODUCTO_ACTUAL:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	
	IF PLACA_ACTUAL = PLACA_NUEVA THEN 
			
			UPDATE vehiculo SET 
				vehiculo_anio=ANIO,
				vehiculo_transmision=TRANSMISION,
				vehiculo_tipo_combustible=COMBUSTIBLE,
				vehiculo_num_chasis=CHASIS,
				vehiculo_num_motor=MOTOR,				
				vehiculo_observaciones=OBSERVACIONES,
				vehiculo_tipo=TIPO,
				vehiculo_estado=ESTADO,
				id_modelo=MODELO,
				id_cliente=CLIENTE 
			WHERE id_vehiculo = ID_VEHI;
			
			
			SELECT 1;
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM vehiculo WHERE vehiculo_placa = PLACA_NUEVA);
		
		IF @CANTIDAD = 0 THEN
		
			UPDATE vehiculo SET
				vehiculo_placa = PLACA_NUEVA,
				vehiculo_anio=ANIO,
				vehiculo_transmision=TRANSMISION,
				vehiculo_tipo_combustible=COMBUSTIBLE,
				vehiculo_num_chasis=CHASIS,
				vehiculo_num_motor=MOTOR,				
				vehiculo_observaciones=OBSERVACIONES,
				vehiculo_tipo=TIPO,
				vehiculo_estado=ESTADO,
				id_modelo=MODELO,
				id_cliente=CLIENTE 
			WHERE id_vehiculo = ID_VEHI;
			
			SELECT 1;
		ELSE 
			SELECT 2;
		END IF;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_VEHICULO_FOTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_VEHICULO_FOTO`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_VEHICULO_FOTO`(IN ID INT, IN IMAGEN VARCHAR(250))
BEGIN
	UPDATE vehiculo SET vehiculo_imagen = IMAGEN WHERE id_vehiculo = ID;
	SELECT 1; #RETORNAMOS
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ELIMINAR_ACCESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ELIMINAR_ACCESO`;
delimiter ;;
CREATE PROCEDURE `SP_ELIMINAR_ACCESO`(IN USUARIO INT,
	IN MODULO VARCHAR(100))
BEGIN
		DELETE FROM acceso WHERE usuario_id = USUARIO AND modulo_codigo = MODULO;
		#INSERT INTO bitacora_marca (accion, fecha_hora, descripcion) VALUES('GUARDAR', NOW(), CONCAT_WS(' ','El usuario con id:', CONVERT(ID_USUARIO_GUARDA,CHAR), 'guardo la marca', NOMBRE));
		SELECT 1; #RETORNAMOS EL CUAL SE GUARDO
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ELIMINAR_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ELIMINAR_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_ELIMINAR_DETALLE`(IN ID INT)
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID);
		
			DELETE FROM detalle_transaccion WHERE transaccion_id = ID;


	
	#SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ELIMINAR_DETALLE_ORDEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ELIMINAR_DETALLE_ORDEN`;
delimiter ;;
CREATE PROCEDURE `SP_ELIMINAR_DETALLE_ORDEN`(IN ID INT)
BEGIN
	DECLARE CANTIDAD INT;
	  SET @CANTIDAD:=(SELECT COUNT(tarea.detalletransaccion_id) AS cant
		 FROM detalle_transaccion INNER JOIN tarea ON detalle_transaccion.detalletransaccion_id = tarea.detalletransaccion_id
		WHERE detalle_transaccion.detalletransaccion_id = ID);
		
		IF @CANTIDAD = 0 THEN
			DELETE FROM detalle_transaccion WHERE detalle_transaccion.detalletransaccion_id = ID;
		ELSE
			DELETE FROM detalle_transaccion WHERE detalletransaccion_id = 0;
		END IF;
	
	#
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ELIMINAR_MOVIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ELIMINAR_MOVIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_ELIMINAR_MOVIMIENTO`(IN ID_TRANSACCION INT)
DELETE FROM detalle_transaccion WHERE transaccion_id = ID_TRANSACCION
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ELIMINAR_TAREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ELIMINAR_TAREA`;
delimiter ;;
CREATE PROCEDURE `SP_ELIMINAR_TAREA`(IN ID INT)
DELETE FROM tarea WHERE detalletransaccion_id = ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_FACTURAR_ORDEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_FACTURAR_ORDEN`;
delimiter ;;
CREATE PROCEDURE `SP_FACTURAR_ORDEN`(IN ID INT,
		IN CANT_PAGO DECIMAL,
		IN NUM_FAC VARCHAR(100),
		IN SERIE_FAC VARCHAR(100))
BEGIN
	UPDATE transacciones SET 
		transaccion_estatus = 'ORDEN FACTURADA',
		transaccion_tipocomprobante = 'FACTURA',
		transaccion_numcomprobante = NUM_FAC,
		transaccion_seriecomprobante = SERIE_FAC,
		transaccion_cantidadpago = CANT_PAGO
	WHERE transaccion_id = ID;
	
	UPDATE detalle_transaccion SET detalle_transaccion.detalletransaccion_estatus = 'ORDEN FACTURADA' 
	WHERE transaccion_id = ID;
	
	SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_GENERARCODIGO_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_GENERARCODIGO_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_GENERARCODIGO_PRODUCTO`()
BEGIN
DECLARE regenerateNumber BOOLEAN default true;
declare regNum int;
declare cn varchar(255);
repeat
SET regNum      := FLOOR(Rand()*90000000+10000000);
SET cn =(SELECT count(*) FROM producto WHERE producto_id = regNum);
select regNum;
if cn=0
then
SET regenerateNumber = false;
end if;
UNTIL regenerateNumber=false
end repeat;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_INFO_EMPRESA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INFO_EMPRESA`;
delimiter ;;
CREATE PROCEDURE `SP_INFO_EMPRESA`()
SELECT
c.conf_id,
c.conf_nombre_empresa,
c.conf_direccion,
c.conf_telefono,
c.conf_celular,
c.conf_rtn,
c.conf_correo,
c.conf_img_logo,
c.conf_isv
FROM configuracion c
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ACCESOS_ACTIVOS_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ACCESOS_ACTIVOS_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ACCESOS_ACTIVOS_USUARIO`(IN ID INT)
BEGIN 
		SELECT 
-- 		a.usuario_id,
		m.modulo_codigo
-- 		m.modulo_nombre,
-- 		m.modulo_descripcion,
-- 		a.acceso_estado
	FROM acceso a INNER JOIN modulo m ON a.modulo_codigo = m.modulo_codigo
	WHERE a.usuario_id = ID AND a.acceso_estado = "ACTIVO";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ACCESOS_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ACCESOS_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ACCESOS_USUARIO`(IN ID INT)
BEGIN 
		SELECT 
		a.usuario_id,
		m.modulo_codigo,
		m.modulo_nombre,
		m.modulo_descripcion,
		a.acceso_estado
	FROM acceso a INNER JOIN modulo m ON a.modulo_codigo = m.modulo_codigo
	WHERE a.usuario_id = ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ACCESOS_USUARIO_NO_TIENE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ACCESOS_USUARIO_NO_TIENE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ACCESOS_USUARIO_NO_TIENE`(IN ID INT)
BEGIN 
		SELECT 
			*
		FROM modulo m
		WHERE m.modulo_codigo NOT IN(
			SELECT 
				a.modulo_codigo
			FROM acceso a
			WHERE a.usuario_id = ID
			GROUP BY a.modulo_codigo
		);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_BITACORA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_BITACORA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_BITACORA`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE)
SELECT
	bitacora.id_bitacora,
	bitacora.id_usuario,
	bitacora.ip_publica,
	bitacora.bitacora_fecha_hora,
	bitacora.bitacora_accion,
	bitacora.bitacora_descripcion,
	bitacora.bitacora_tabla,
	usuario.usuario_nombre,
	CONCAT_WS(' ', persona.persona_nombre, persona.persona_apepat, persona.persona_apmat) AS nombre
FROM
	bitacora INNER JOIN usuario ON bitacora.id_usuario = usuario.usuario_id
						INNER JOIN persona ON usuario.persona_id = persona.persona_id
WHERE bitacora.bitacora_fecha_hora BETWEEN FECHA_INICIO AND FECHA_FIN 
ORDER BY bitacora.bitacora_fecha_hora DESC
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CATEGORIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CATEGORIA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CATEGORIA`()
SELECT
	categoria.categoria_id, 
	categoria.categoria_nombre, 
	categoria.categoria_fregistro, 
	categoria.categoria_estatus
FROM
	categoria
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CLIENTE`()
SELECT
	persona.persona_id,
	CONCAT_WS(' ',persona_nombre,persona_apepat, persona_apmat) as NOMBRE_PERSONA,
	persona.persona_nombre, 
	persona.persona_apepat, 
	persona.persona_apmat, 
	persona.persona_nrodocumento, 
	persona.persona_tipodocumento, 
	persona.persona_sexo, 
	persona.persona_telefono, 
	persona.persona_correo, 
	cliente.cliente_id,
	cliente.cliente_fregistro, 
	cliente.cliente_estatus,
	persona.persona_empresa
FROM
	cliente INNER JOIN persona ON cliente.persona_id = persona.persona_id
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_CATEGORIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_CATEGORIA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_CATEGORIA`()
SELECT
	categoria.categoria_id, 
	categoria.categoria_nombre
FROM
	categoria
WHERE categoria_estatus = 'ACTIVO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_FABRICANTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_FABRICANTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_FABRICANTE`()
SELECT fabricante.id_fabricante, fabricante.fabricante_nombre
	FROM fabricante
WHERE fabricante.fabricante_estado = 'ACTIVO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_MARCA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_MARCA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_MARCA`()
SELECT
	id_marca, 
	marca_nombre
FROM
	marca
WHERE marca_estado = 'ACTIVO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_MODELO_MARCA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_MODELO_MARCA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_MODELO_MARCA`(IN ID INT)
SELECT
	id_modelo, 
	modelo_nombre
FROM
	modelo
WHERE modelo_estado = 'ACTIVO' AND id_marca = ID
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PERSONA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_PERSONA`()
SELECT persona_id ,CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat)
	FROM persona
WHERE persona_estatus = 'ACTIVO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_PRODUCTO`()
SELECT producto_id, producto_nombre FROM producto WHERE producto_estatus = 'ACTIVO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_PROVEEDOR`()
SELECT proveedor_id, proveedor_razonsocial FROM proveedor WHERE proveedor_estatus = 'ACTIVO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_ROL`()
SELECT rol_id ,rol_nombre
	FROM rol
WHERE rol_estatus = 'ACTIVO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_UNIDAD_MEDIDA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_UNIDAD_MEDIDA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_UNIDAD_MEDIDA`()
SELECT
	unidad_medida.unidad_id, 
	unidad_medida.unidad_nombre
FROM
	unidad_medida
WHERE unidad_estatus = 'ACTIVO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CONFIGURACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CONFIGURACION`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CONFIGURACION`()
SELECT
	configuracion.conf_id, 
	configuracion.conf_nombre_empresa,
	configuracion.conf_direccion,
	configuracion.conf_telefono,
	configuracion.conf_celular,
	configuracion.conf_rtn, 
	configuracion.conf_correo, 
	configuracion.conf_img_logo,
	configuracion.conf_isv,	
	configuracion.conf_cai, 
	configuracion.conf_fact_fechalimite_emision, 
	configuracion.conf_cantidad_fact, 
	configuracion.conf_numero_inicial, 
	configuracion.conf_numero_final, 
	configuracion.conf_preciodolar
	
FROM
	configuracion
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COTIZACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COTIZACION`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COTIZACION`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE)
SELECT
	t.transaccion_id as cotizacion_id,
	t.usuario_id,
	t.transaccion_fecha as cotizacion_fecha,
	t.transaccion_total as cotizacion_total,
	t.transaccion_impuesto as cotizacion_impuesto,
	t.transaccion_estatus as cotizacion_estatus,
	u.usuario_nombre,
	t.transaccion_porcentaje as porcentaje,
	CONCAT_WS(' ', p.persona_nombre, p.persona_apepat, p.persona_apmat) AS nombre_cliente,
	p.persona_correo,
	p.persona_empresa,
	p.persona_telefono,
	p.persona_nrodocumento,
	p.persona_id
FROM
	transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
									INNER JOIN persona p ON t.persona_id = p.persona_id
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN AND
t.transaccion_tipo = 'COTIZACION'
ORDER BY t.transaccion_fecha DESC
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_DETALLE_COTIZACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_COTIZACION`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_DETALLE_COTIZACION`(IN ID_TRANSACCION INT)
SELECT
	detalle_transaccion.detalletransaccion_id,
	detalle_transaccion.transaccion_id,
	detalle_transaccion.producto_id,
	detalle_transaccion.detalletransaccion_nombrepro as producto_nombre,
	producto.prod_serv_tipo,
	detalle_transaccion.detalletransaccion_precio as detalle_precio,
	detalle_transaccion.detalletransaccion_cantidad as detalle_cantidad,
	detalle_transaccion.detalletransaccion_descuento as detalle_descuento,
	(detalle_transaccion.detalletransaccion_descuento*detalle_transaccion.detalletransaccion_cantidad) as descuento_total,
	(detalle_transaccion.detalletransaccion_cantidad * detalle_transaccion.detalletransaccion_precio) as SUB_TOTAL,
	producto_stock
FROM detalle_transaccion INNER JOIN producto ON detalle_transaccion.producto_id = producto.producto_id
WHERE detalle_transaccion.transaccion_id = ID_TRANSACCION
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_DETALLE_MOVIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_MOVIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_DETALLE_MOVIMIENTO`(IN ID_TRANSACCION INT)
SELECT
	dt.detalletransaccion_nombrepro as producto_nombre,
	dt.detalletransaccion_cantidad as detallemovimiento_cantidad,
	dt.producto_id,
	dt.detalletransaccion_id,
	p.producto_stock
FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
WHERE dt.transaccion_id = ID_TRANSACCION
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_DETALLE_NGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_NGRESO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_DETALLE_NGRESO`(IN ID_TRANSACCION INT)
SELECT detalle_transaccion.detalletransaccion_nombrepro as producto_nombre,
 detalle_transaccion.detalletransaccion_cantidad as detalleingreso_cantidad,
 detalle_transaccion.detalletransaccion_precio as detalleingreso_precio,
 (detalle_transaccion.detalletransaccion_cantidad * detalle_transaccion.detalletransaccion_precio) as SUB_TOTAL ,
 detalle_transaccion.producto_id
FROM detalle_transaccion
WHERE detalle_transaccion.transaccion_id = ID_TRANSACCION
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_DETALLE_ORDENR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_ORDENR`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_DETALLE_ORDENR`(IN ID_TRANSACCION INT)
SELECT
	detalle_transaccion.detalletransaccion_id,
	detalle_transaccion.transaccion_id,
	detalle_transaccion.producto_id,
	detalle_transaccion.detalletransaccion_nombrepro as producto_nombre,
	producto.prod_serv_tipo,
	detalle_transaccion.detalletransaccion_precio as detalle_precio,
	detalle_transaccion.detalletransaccion_cantidad as detalle_cantidad,
	detalle_transaccion.detalletransaccion_descuento as detalle_descuento,
	(detalle_transaccion.detalletransaccion_descuento*detalle_transaccion.detalletransaccion_cantidad) as descuento_total,
	(detalle_transaccion.detalletransaccion_cantidad * detalle_transaccion.detalletransaccion_precio) as SUB_TOTAL,
	producto_stock,
	(SELECT tarea.estado FROM tarea WHERE tarea.detalletransaccion_id = detalle_transaccion.detalletransaccion_id) as status
FROM detalle_transaccion INNER JOIN producto ON detalle_transaccion.producto_id = producto.producto_id
WHERE detalle_transaccion.transaccion_id = ID_TRANSACCION
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_DETALLE_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_DETALLE_VENTA`(IN ID_TRANSACCION INT)
SELECT
	detalle_transaccion.detalletransaccion_nombrepro as producto_nombre,
	detalle_transaccion.detalletransaccion_cantidad as detalleventa_cantidad,
	detalle_transaccion.detalletransaccion_precio as detalleventa_precio,
	detalle_transaccion.detalletransaccion_descuento as detalleventa_descuento,
	(detalle_transaccion.detalletransaccion_cantidad * detalle_transaccion.detalletransaccion_precio) as SUB_TOTAL
FROM detalle_transaccion
WHERE detalle_transaccion.transaccion_id = ID_TRANSACCION
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_FABRICANTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_FABRICANTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_FABRICANTE`()
SELECT
fabricante.fabricante_fregistro,
fabricante.fabricante_estado,
fabricante.fabricante_descripcion,
fabricante.fabricante_nombre,
fabricante.id_fabricante
FROM
fabricante
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_HISTORIAL_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_HISTORIAL_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_HISTORIAL_PRODUCTO`(IN ID_CODIGO VARCHAR(20))
SELECT
	h.producto_codigo,
	h.producto_nombre,
	h.producto_nombre_nuevo,
	h.producto_precio_venta,
	h.producto_precio_venta_nuevo,
	h.fecha_historial
FROM producto_historial h
WHERE h.producto_codigo = ID_CODIGO
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ID_DETALLE_ORDEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ID_DETALLE_ORDEN`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ID_DETALLE_ORDEN`(IN ID_TRANSACCION INT)
BEGIN
	SELECT 
		detalle_transaccion.detalletransaccion_id
	FROM detalle_transaccion WHERE transaccion_id = ID_TRANSACCION;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_IMPUESTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_IMPUESTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_IMPUESTO`()
SELECT
	conf_isv
FROM configuracion
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_INGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_INGRESO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_INGRESO`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE, IN ESTADO VARCHAR(30))
SELECT
	t.transaccion_id as ingreso_id,
	tp.proveedor_id,
	t.usuario_id,
	t.transaccion_tipocomprobante as ingreso_tipcomprobante,
	t.transaccion_seriecomprobante as ingreso_seriecomprobante,
	t.transaccion_numcomprobante as ingreso_numcomprobante,
	t.transaccion_fecha as ingreso_fecha,
	t.transaccion_total as ingreso_total,
	t.transaccion_impuesto as ingreso_impuesto,
	t.transaccion_estatus as ingreso_estatus,
	u.usuario_nombre,
	CONCAT_WS(' ',ps.persona_nombre,ps.persona_apepat,ps.persona_apmat) AS NOMBRE_PROVEEDOR,
	ps.persona_nombre, 
	ps.persona_apepat, 
	ps.persona_apmat,
	p.proveedor_razonsocial,
	t.transaccion_porcentaje as porcentaje
FROM
	transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
	INNER JOIN transaccion_proveedor tp ON tp.transaccion_id = t.transaccion_id
	INNER JOIN proveedor p ON p.proveedor_id = tp.proveedor_id
	INNER JOIN persona ps ON ps.persona_id = p.persona_id
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN 
AND CASE
			WHEN ESTADO = 'ANULADO' THEN
				t.transaccion_estatus IN ('ANULADO','AJUSTE ANULADO')
			WHEN ESTADO = 'AJUSTES' THEN	
				t.transaccion_estatus = 'AJUSTE'
			WHEN ESTADO = 'INGRESADO' THEN	
				t.transaccion_estatus = 'INGRESADO'
			WHEN ESTADO = 'TODOS' THEN	
				t.transaccion_estatus IN ('INGRESADO', 'AJUSTE', 'ANULADO', 'AJUSTE ANULADO')	
			ELSE
				t.transaccion_estatus IN ('INGRESADO', 'AJUSTE') 
		END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_INGRESO_COTIZACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_INGRESO_COTIZACION`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_INGRESO_COTIZACION`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE)
SELECT
	*
FROM
	transacciones t 
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN AND
t.transaccion_tipo = 'COTIZACION'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_MARCA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_MARCA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_MARCA`()
SELECT
	*
FROM
	marca
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_MODELO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_MODELO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_MODELO`()
SELECT
	m.id_modelo,
	m.modelo_nombre,
	m.modelo_descripcion,
	m.modelo_estado,
	m.id_marca,
	ma.marca_nombre	
FROM
	modelo m  INNER JOIN marca ma ON m.id_marca = ma.id_marca
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_MOVIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_MOVIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_MOVIMIENTO`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT t.transaccion_id, u.usuario_nombre, t.transaccion_fecha, t.transaccion_observaciones, t.transaccion_estatus
FROM transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
WHERE transaccion_tipo = 'MOVIMIENTO' 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_NOTIFICACIONES
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_NOTIFICACIONES`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_NOTIFICACIONES`()
SELECT producto_nombre, producto_stock FROM producto WHERE producto_stock <= producto_stock_minimo AND prod_serv_tipo = 'PRODUCTO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ORDEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ORDEN`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ORDEN`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE)
SELECT
	t.transaccion_id as cotizacion_id,
	t.usuario_id,
	t.transaccion_fecha as cotizacion_fecha,
	t.transaccion_total as cotizacion_total,
	t.transaccion_impuesto as cotizacion_impuesto,
	t.transaccion_estatus as cotizacion_estatus,
	u.usuario_nombre,
	t.transaccion_porcentaje as porcentaje,
	CONCAT_WS(' ', p.persona_nombre, p.persona_apepat, p.persona_apmat) AS nombre_cliente,
	p.persona_correo,
	p.persona_empresa,
	p.persona_telefono,
	p.persona_nrodocumento,
	p.persona_id,
	tv.id_usuario as mecanico,
	tv.id_vehiculo,
	tv.nivel_combustible,
	tv.descripcion,
	tv.`vehiculo_km/millas` as kilometraje,
	m.modelo_nombre,
	(SELECT mar.marca_nombre FROM marca mar WHERE mar.id_marca = m.id_marca) as marca_nom,
	v.vehiculo_anio,
	v.id_vehiculo,
	v.vehiculo_placa,
	v.vehiculo_num_chasis,
	v.vehiculo_num_motor,
	v.vehiculo_transmision,
	v.vehiculo_tipo,
	(SELECT CONCAT_WS(' ', per.persona_nombre, per.persona_apepat, per.persona_apmat) FROM usuario usu INNER JOIN persona per ON usu.persona_id = per.persona_id WHERE usu.usuario_id = tv.id_usuario) as nombre_mecanico,
	tv.id_usuario as id_mecanico,
	(SELECT SUM(dt.detalletransaccion_cantidad * dt.detalletransaccion_precio) FROM detalle_transaccion dt WHERE dt.transaccion_id = t.transaccion_id)AS subtotal,
	(SELECT SUM(dt2.detalletransaccion_cantidad * dt2.detalletransaccion_descuento) FROM detalle_transaccion dt2 WHERE dt2.transaccion_id = t.transaccion_id) AS descuento
FROM
	transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
									INNER JOIN persona p ON t.persona_id = p.persona_id
									INNER JOIN transaccion_vehiculo tv ON t.transaccion_id = tv.id_transaccion
									INNER JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
									INNER JOIN modelo m ON v.id_modelo = m.id_modelo
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN AND
t.transaccion_tipo = 'ORDEN'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ORDEN_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ORDEN_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ORDEN_CLIENTE`()
SELECT t.transaccion_id, CONCAT(t.id_correlativo,' - ',p.persona_nombre,' ',p.persona_apepat, ' ',p.persona_apmat, ' - '
, IF(ma.marca_nombre IS NULL,'',ma.marca_nombre), ' ',IF(m.modelo_nombre IS NULL,'',m.modelo_nombre), ' - ', IF(v.vehiculo_placa IS NULL,'',v.vehiculo_placa))
	FROM transacciones t INNER JOIN persona p ON t.persona_id = p.persona_id
	INNER JOIN transaccion_vehiculo tv ON t.transaccion_id = tv.id_transaccion
	INNER JOIN vehiculo v ON v.id_vehiculo = tv.id_vehiculo
	INNER JOIN modelo m ON m.id_modelo = v.id_modelo
	INNER JOIN marca ma ON ma.id_marca = m.id_marca
WHERE t.transaccion_tipo = 'ORDEN' AND t.transaccion_estatus = 'INICIADO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PERSONA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PERSONA`()
SELECT
	CONCAT_WS(' ',p.persona_nombre,p.persona_apepat,p.persona_apmat) as NOMBRE_PERSONA,
	p.persona_nombre,
	p.persona_apepat,
	p.persona_apmat,
	p.persona_id,  
	p.persona_nrodocumento, 
	p.persona_tipodocumento, 
	p.persona_sexo, 
	p.persona_telefono,
	p.persona_estatus,
	p.persona_correo,
	p.persona_empresa,
	CASE 
	WHEN c.persona_id IS NOT NULL THEN 'CLIENTE'
	WHEN pr.persona_id IS NOT NULL THEN 'PROVEEDOR'
	WHEN u.persona_id IS NOT NULL THEN 'USUARIO'
	ELSE
		'PERSONA'
END as tipo_persona
	FROM persona p LEFT JOIN cliente c on c.persona_id = p.persona_id
	LEFT JOIN proveedor pr ON pr.persona_id = p.persona_id
	LEFT JOIN usuario u ON p.persona_id = u.persona_id
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PRODUCTO`()
SELECT
	producto.producto_id, 
	producto.producto_nombre,
	producto.prod_serv_tipo,
	producto.producto_oferta,
	producto.producto_descuento,
	producto.producto_stock, 
	producto.categoria_id, 
	producto.unidad_id,
	producto.id_fabricante,	
	producto.producto_foto, 
	producto.producto_precioventa, 
	producto.producto_descripcion, 
	producto.producto_estatus, 
	unidad_medida.unidad_nombre, 
	categoria.categoria_nombre,
	f.fabricante_nombre,
	producto.producto_preciocompra,
	producto.producto_stock_minimo,
	producto.producto_codigo
	
FROM
	producto INNER JOIN categoria ON producto.categoria_id = categoria.categoria_id
	INNER JOIN unidad_medida ON producto.unidad_id = unidad_medida.unidad_id
	INNER JOIN fabricante f ON f.id_fabricante = producto.id_fabricante
WHERE prod_serv_tipo='PRODUCTO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PROVEEDOR`()
SELECT
	proveedor.proveedor_numcontacto, 
	proveedor.proveedor_contacto, 
	CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat) AS NOMBRE_PROVEEDOR,
	persona.persona_nombre, 
	persona.persona_apepat, 
	persona.persona_apmat, 
	persona.persona_nrodocumento, 
	persona.persona_tipodocumento, 
	persona.persona_sexo, 
	persona.persona_telefono, 
	proveedor.proveedor_id, 
	proveedor.proveedor_estatus,
	proveedor_razonsocial,
	proveedor.persona_id,
	persona.persona_correo
FROM
	proveedor INNER JOIN persona ON proveedor.persona_id = persona.persona_id
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ROL`()
SELECT
	rol.rol_id, 
	rol.rol_nombre, 
	rol.rol_estatus, 
	rol.rol_feregistro
FROM
	rol
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_SERVICES_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_SERVICES_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_SERVICES_CLIENTE`(IN ID_TRANSACCION INT)
SELECT dt.detalletransaccion_id, dt.detalletransaccion_nombrepro, 
	IF(t.estado IS NULL,'DISPONIBLE',t.estado)
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	LEFT JOIN tarea t ON t.detalletransaccion_id = dt.detalletransaccion_id
WHERE dt.transaccion_id = ID_TRANSACCION AND p.prod_serv_tipo = 'SERVICIO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_SERVICIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_SERVICIO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_SERVICIO`()
SELECT
	producto.producto_id, 
	producto.producto_nombre,
	producto.prod_serv_tipo,
	producto.producto_oferta,
	producto.producto_descuento,
	producto.producto_stock, 
	producto.categoria_id, 
	producto.unidad_id,
	producto.id_fabricante,	
	producto.producto_foto, 
	producto.producto_precioventa, 
	producto.producto_descripcion, 
	producto.producto_estatus, 
	categoria.categoria_nombre,
	producto.producto_preciocompra,
	producto.producto_stock_minimo,
	producto.producto_codigo
	
FROM
	producto INNER JOIN categoria ON producto.categoria_id = categoria.categoria_id
WHERE prod_serv_tipo='SERVICIO'
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TAREAS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TAREAS`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TAREAS`(IN ID_USER INT)
BEGIN 

	DECLARE TIPO_USER VARCHAR(30);
	DECLARE PERSONA_ID INT;
	
	SET @TIPO_USER:=(SELECT r.rol_nombre FROM usuario u INNER JOIN rol r ON u.rol_id = r.rol_id WHERE u.usuario_id = ID_USER);
	
	CASE 
#1	
	WHEN @TIPO_USER = 'CLIENTE' THEN
		SET @PERSONA_ID:=(SELECT p.persona_id FROM usuario u INNER JOIN persona p ON u.persona_id = p.persona_id 
		WHERE u.usuario_id = ID_USER);
	
		SELECT t.id_tarea as id, dt.detalletransaccion_nombrepro as title, t.fecha_inicio as start, t.fecha_fin as end, 
		CASE 
			WHEN t.estado = 'PENDIENTE' THEN '#07C7DA'
			WHEN t.estado = 'ORDEN ANULADA' THEN '#E74C3C '
			ELSE '#78CA25'
		END as color, 
		t.tarea_notas, t.estado, CONCAT_WS(' ',pr.persona_nombre,pr.persona_apepat,pr.persona_apmat) as NOMBRE_CLIENTE,
		CONCAT(ma.marca_nombre,' ',m.modelo_nombre,' - ',v.vehiculo_placa) AS info_vehiculo
		FROM tarea t INNER JOIN detalle_transaccion dt ON t.detalletransaccion_id = dt.detalletransaccion_id
		INNER JOIN producto p ON p.producto_id = dt.producto_id
		INNER JOIN transacciones tr ON tr.transaccion_id = dt.transaccion_id
		INNER JOIN persona pr ON tr.persona_id = pr.persona_id
		LEFT JOIN transaccion_vehiculo tv ON tr.transaccion_id = tv.id_transaccion
		LEFT JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
		LEFT JOIN modelo m ON m.id_modelo = v.id_modelo
		LEFT JOIN marca ma ON ma.id_marca = m.id_marca
		WHERE p.prod_serv_tipo = 'SERVICIO' AND pr.persona_id = @PERSONA_ID;

#2
	WHEN @TIPO_USER = 'MECANICO' THEN 
		
	SELECT t.id_tarea as id, dt.detalletransaccion_nombrepro as title, t.fecha_inicio as start, t.fecha_fin as end, 
		CASE 
			WHEN t.estado = 'PENDIENTE' THEN '#07C7DA'
			WHEN t.estado = 'ORDEN ANULADA' THEN '#E74C3C '
			ELSE '#78CA25'
		END as color, 
		t.tarea_notas, t.estado, CONCAT_WS(' ',pr.persona_nombre,pr.persona_apepat,pr.persona_apmat) as NOMBRE_CLIENTE,
		CONCAT(ma.marca_nombre,' ',m.modelo_nombre,' - ',v.vehiculo_placa) AS info_vehiculo
		FROM tarea t INNER JOIN detalle_transaccion dt ON t.detalletransaccion_id = dt.detalletransaccion_id
		INNER JOIN producto p ON p.producto_id = dt.producto_id
		INNER JOIN transacciones tr ON tr.transaccion_id = dt.transaccion_id
		INNER JOIN persona pr ON tr.persona_id = pr.persona_id
		LEFT JOIN transaccion_vehiculo tv ON tr.transaccion_id = tv.id_transaccion
		LEFT JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
		LEFT JOIN modelo m ON m.id_modelo = v.id_modelo
		LEFT JOIN marca ma ON ma.id_marca = m.id_marca
	WHERE p.prod_serv_tipo = 'SERVICIO' AND tv.id_usuario = ID_USER;

	ELSE
	
		SELECT t.id_tarea as id, dt.detalletransaccion_nombrepro as title, t.fecha_inicio as start, t.fecha_fin as end, 
		CASE 
			WHEN t.estado = 'PENDIENTE' THEN '#07C7DA'
			WHEN t.estado = 'ORDEN ANULADA' THEN '#E74C3C '
			ELSE '#78CA25'
		END as color , 
		t.tarea_notas, t.estado, CONCAT_WS(' ',pr.persona_nombre,pr.persona_apepat,pr.persona_apmat) as NOMBRE_CLIENTE,
	CONCAT(ma.marca_nombre,' ',m.modelo_nombre,' - ',v.vehiculo_placa) AS info_vehiculo
	FROM tarea t INNER JOIN detalle_transaccion dt ON t.detalletransaccion_id = dt.detalletransaccion_id
	INNER JOIN producto p ON p.producto_id = dt.producto_id
	INNER JOIN transacciones tr ON tr.transaccion_id = dt.transaccion_id
	LEFT JOIN transaccion_vehiculo tv ON tr.transaccion_id = tv.id_transaccion
	INNER JOIN persona pr ON tr.persona_id = pr.persona_id
	LEFT JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
	LEFT JOIN modelo m ON m.id_modelo = v.id_modelo
	LEFT JOIN marca ma ON ma.id_marca = m.id_marca
WHERE p.prod_serv_tipo = 'SERVICIO';
 
	END CASE;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_UNIDAD_MEDIDA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_UNIDAD_MEDIDA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_UNIDAD_MEDIDA`()
SELECT
	unidad_medida.unidad_id, 
	unidad_medida.unidad_nombre,
	unidad_medida.unidad_abreviatura,	
	unidad_medida.unidad_fregistro, 
	unidad_medida.unidad_estatus
FROM
	unidad_medida
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_USUARIO`()
SELECT
	usuario.usuario_id, 
	usuario.usuario_nombre,
	usuario.usuario_intento,
	usuario.usuario_estatus, 
	usuario.usuario_imagen, 
	usuario.rol_id, 
	usuario.persona_id, 
	rol.rol_nombre,
	usuario.usuario_password,
	CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat) as NOMBRE_PERSONA,
	persona.persona_nombre, 
	persona.persona_apepat, 
	persona.persona_apmat,
	persona.persona_correo,
	persona.persona_tipodocumento,
	persona.persona_nrodocumento,
	persona.persona_telefono,
	persona.persona_sexo
FROM usuario INNER JOIN rol ON usuario.rol_id = rol.rol_id
INNER JOIN persona ON usuario.persona_id = persona.persona_id
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_USUARIO_MECANICO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO_MECANICO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_USUARIO_MECANICO`()
SELECT
	usuario.usuario_id, 
	usuario.usuario_estatus, 
	usuario.usuario_imagen, 
	usuario.persona_id, 
	usuario.usuario_password,
	CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat) as NOMBRE_PERSONA,
	persona.persona_correo,
	persona.persona_tipodocumento,
	persona.persona_nrodocumento,
	persona.persona_telefono,
	persona.persona_sexo
FROM usuario INNER JOIN persona ON usuario.persona_id = persona.persona_id
							INNER JOIN rol ON usuario.rol_id = rol.rol_id
#WHERE usuario.usuario_tipo = 'MECANICO'
WHERE rol.rol_nombre = 'MECANICO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_VEHICULO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_VEHICULO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_VEHICULO`()
SELECT
 v.id_vehiculo,
 v.vehiculo_placa,
 v.vehiculo_anio,
 v.vehiculo_transmision,
 v.vehiculo_tipo_combustible,
 v.vehiculo_num_chasis,
 v.vehiculo_num_motor,
 v.vehiculo_observaciones,
 v.vehiculo_imagen,
 v.vehiculo_tipo,
 v.vehiculo_estado,
 v.id_modelo,
 v.id_cliente,
 mo.modelo_nombre,
 mo.id_marca,
 ma.marca_nombre,
 CONCAT_WS(' ',p.persona_nombre ,p.persona_apepat,p.persona_apmat) AS cliente_nombre
FROM vehiculo v INNER JOIN modelo mo ON v.id_modelo = mo.id_modelo
							  INNER JOIN marca  ma ON mo.id_marca = ma.id_marca
								INNER JOIN cliente c ON v.id_cliente = c.cliente_id
								INNER JOIN persona p ON c.persona_id = p.persona_id
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_VEHICULO_POR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_VEHICULO_POR_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_VEHICULO_POR_CLIENTE`(IN ID_CLIENTE INT)
SELECT
vehiculo.vehiculo_placa,
marca.marca_nombre,
modelo.modelo_nombre,
vehiculo.vehiculo_tipo,
vehiculo.vehiculo_num_motor,
vehiculo.vehiculo_num_chasis,
vehiculo.vehiculo_anio,
vehiculo.vehiculo_transmision,
vehiculo.vehiculo_imagen,
vehiculo.vehiculo_estado,
vehiculo.vehiculo_estado,
vehiculo.id_vehiculo
FROM
vehiculo
INNER JOIN modelo ON vehiculo.id_modelo = modelo.id_modelo
INNER JOIN marca ON modelo.id_marca = marca.id_marca
INNER JOIN cliente ON vehiculo.id_cliente = cliente.cliente_id
WHERE cliente.persona_id = ID_CLIENTE
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_VENTA`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT
	t.transaccion_id as venta_id,
	t.persona_id as cliente_id,
	t.usuario_id,
	t.transaccion_tipocomprobante as venta_ticomprobante,
	t.transaccion_seriecomprobante as venta_seriecomprobante,
	t.transaccion_numcomprobante as venta_numcomprobante,
	t.transaccion_fecha as venta_fecha,
	t.transaccion_total as venta_total,
	t.transaccion_impuesto as venta_impuesto,
	t.transaccion_estatus as venta_estatus,
	u.usuario_nombre,
	CONCAT_WS(' ',ps.persona_nombre,ps.persona_apepat,ps.persona_apmat) AS NOMBRE_CLIENTE,
	ps.persona_nombre, 
	ps.persona_apepat, 
	ps.persona_apmat,
	t.transaccion_porcentaje
FROM
	transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
	INNER JOIN persona ps ON ps.persona_id = t.persona_id
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN AND
t.transaccion_tipo = 'VENTA'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MESES_MAS_VENTAS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MESES_MAS_VENTAS`;
delimiter ;;
CREATE PROCEDURE `SP_MESES_MAS_VENTAS`()
SELECT MONTHNAME(transaccion_fecha) NOMBRE_MES, COUNT(transaccion_id) CANTIDAD
	FROM transacciones 
WHERE YEAR(transaccion_fecha) = YEAR(CURDATE()) AND transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO')
GROUP BY NOMBRE_MES
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_NUMERO_FINAL_FACTURA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_NUMERO_FINAL_FACTURA`;
delimiter ;;
CREATE PROCEDURE `SP_NUMERO_FINAL_FACTURA`()
SELECT conf_numero_final FROM configuracion
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_NUM_COMPROBANTE_INGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_NUM_COMPROBANTE_INGRESO`;
delimiter ;;
CREATE PROCEDURE `SP_NUM_COMPROBANTE_INGRESO`()
SELECT MAX(transaccion_numcomprobante) FROM transacciones WHERE transaccion_tipo <> 'VENTA'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_OBTENER_DATOS_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_OBTENER_DATOS_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_OBTENER_DATOS_USUARIO`(IN ID_USUARIO INT)
SELECT
	usuario.usuario_id, usuario.usuario_nombre, usuario.usuario_password, persona.persona_correo, 
	usuario.usuario_intento, usuario.usuario_estatus, usuario.rol_id, usuario.usuario_imagen, 
	rol.rol_nombre, persona.persona_nombre, persona.persona_apepat, persona.persona_apmat, 
	persona.persona_nrodocumento, persona.persona_tipodocumento, persona.persona_sexo, 
	persona.persona_telefono, persona.persona_fregistro
FROM usuario INNER JOIN rol ON usuario.rol_id = rol.rol_id
	INNER JOIN persona ON usuario.persona_id = persona.persona_id
WHERE usuario_id = ID_USUARIO
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_OBTENER_DATOS_WIDGET
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_OBTENER_DATOS_WIDGET`;
delimiter ;;
CREATE PROCEDURE `SP_OBTENER_DATOS_WIDGET`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT IFNULL(SUM(t.transaccion_total),0) as venta_total,

(SELECT IFNULL(SUM(transaccion_total),0) FROM transacciones WHERE transaccion_estatus = 'INGRESADO' AND transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as ingreso_total, 

(SELECT COUNT(*) FROM transacciones t WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_de_transacciones,

(SELECT COUNT(*) FROM transacciones WHERE transaccion_estatus = 'INGRESADO' AND transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_ingresos,

(SELECT COUNT(*) FROM transacciones WHERE transaccion_estatus = 'COTIZADO' AND transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_cotizaciones,

(SELECT COUNT(*) FROM producto WHERE prod_serv_tipo = 'PRODUCTO') as cantidad_productos,
(SELECT COUNT(*) FROM producto WHERE prod_serv_tipo = 'SERVICIO') as cantidad_servicios,

(SELECT COUNT(*) FROM producto WHERE producto_oferta = 1) as cantidad_productos_oferta,

(SELECT CONCAT_WS(' ',p.persona_nombre,p.persona_apmat,p.persona_apepat)  
	FROM usuario u INNER JOIN transacciones t ON u.usuario_id = t.usuario_id 
	INNER JOIN persona p ON u.persona_id = p.persona_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN 
GROUP BY u.usuario_nombre 
ORDER BY COUNT(t.usuario_id) DESC 
LIMIT 1) as empleado_mas_ventas,

(SELECT COUNT(*) FROM transacciones t WHERE t.transaccion_estatus = 'MOVIMIENTO'
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_movimientos,

(SELECT COUNT(*) FROM transacciones t WHERE t.transaccion_estatus = 'AJUSTE'
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_ajustes

	FROM transacciones t 
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_ACCESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ACCESO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_ACCESO`(IN USUARIO INT,
	IN MODULO VARCHAR(100))
INSERT INTO acceso(modulo_codigo, usuario_id, acceso_estado) VALUES(MODULO, USUARIO, 'ACTIVO');
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_BITACORA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_BITACORA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_BITACORA`(IN ID_USU INT,
	IN ACCION VARCHAR(45),
	IN TABLA VARCHAR(100),
	IN DESCRIPCION TEXT,
	IN PUBLI VARCHAR(100))
BEGIN
	
				
		INSERT INTO bitacora (
													bitacora.id_usuario, 
													bitacora.bitacora_accion,
													bitacora.bitacora_tabla,
													bitacora.bitacora_fecha_hora,
													bitacora.bitacora_descripcion,
													bitacora.ip_publica
													) 
		VALUES (
						ID_USU,
						ACCION,
						TABLA,
						NOW(),
						DESCRIPCION,
						PUBLI
						);
		SELECT 1;	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_BITACORA_ACCESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_BITACORA_ACCESO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_BITACORA_ACCESO`(IN ID_USU INT,
	IN ACCION VARCHAR(45),
	IN TABLA VARCHAR(100),
	IN DESCRIPCION TEXT,
	IN PUBLI VARCHAR(100))
INSERT INTO bitacora (
			bitacora.id_usuario, 
			bitacora.bitacora_accion,
			bitacora.bitacora_tabla,
			bitacora.bitacora_fecha_hora,
			bitacora.bitacora_descripcion,
			bitacora.ip_publica
			) 
		VALUES (
						ID_USU,
						ACCION,
						TABLA,
						NOW(),
						DESCRIPCION,
						PUBLI
						)
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CATEGORIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CATEGORIA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_CATEGORIA`(IN CATEGORIA VARCHAR(100))
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM categoria WHERE categoria_nombre = CATEGORIA);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO categoria (categoria_nombre, categoria_fregistro,categoria_estatus) VALUES (CATEGORIA, CURDATE(), 'ACTIVO'); #CURDATE () devuelve la fecha actual.
		SELECT 1; #RETORNAMOS
	ELSE
		SELECT 2; #RETORNAMOS
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_CLIENTE`(IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17),
	IN CORREO VARCHAR(70),
	IN EMPRESA VARCHAR(100))
BEGIN

	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_CORREO INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
	SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
	
	IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
		INSERT INTO persona (persona_nombre, persona_apepat, persona_apmat, persona_nrodocumento, persona_tipodocumento, persona_sexo,persona_telefono, persona_fregistro, persona_estatus, persona_correo, persona_empresa) 
		VALUES (NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, N_DOCUMENTO, TIPO_DOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO', CORREO, EMPRESA);
		INSERT INTO cliente (cliente_fregistro, cliente_estatus, persona_id) VALUES (CURDATE(), 'ACTIVO', LAST_INSERT_ID());
		#LAST_INSERT_ID() = Obtiene el ultimo ID registrado en la tabla persona
		SELECT 1; #RETORNAMOS
	ELSE
		IF @CANTIDAD > 0 THEN
				SELECT 2;
			ELSEIF @CANTIDAD_CORREO > 0 THEN
				SELECT 3;
			ELSE
				SELECT 4;
			END IF;
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CONFIGURACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CONFIGURACION`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_CONFIGURACION`(IN NOMBRE VARCHAR(255),
IN DIRECCION VARCHAR(255),
IN TELEFONO VARCHAR(20),
IN CELULAR VARCHAR(20),
IN RTN VARCHAR(100),
IN CORREO VARCHAR(100),
IN FOTO VARCHAR(255),
IN ISV DECIMAL(2,2),
IN CAI VARCHAR(255),
IN FECHALIMITE DATE,
IN CANTIDADFACTURA INT,
IN NUMERO_INICIAL VARCHAR(50),
IN NUMERO_FINAL VARCHAR(50),
IN PRECIO_DOLAR DECIMAL(5,2))
BEGIN
DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM configuracion WHERE conf_nombre_empresa = NOMBRE);



IF @CANTIDAD = 0 THEN
	
		INSERT INTO configuracion (conf_nombre_empresa, conf_direccion,conf_telefono, conf_celular, conf_rtn,conf_correo,conf_img_logo,conf_isv, conf_cai, conf_fact_fechalimite_emision,conf_cantidad_fact,conf_numero_inicial,conf_numero_final,conf_preciodolar)
		VALUES (NOMBRE,DIRECCION, TELEFONO,CELULAR,RTN, CORREO,FOTO,ISV, CAI, FECHALIMITE,CANTIDADFACTURA,NUMERO_INICIAL,NUMERO_FINAL,PRECIO_DOLAR);
					SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_COTIZACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_COTIZACION`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_COTIZACION`(IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN OBSER TEXT)
BEGIN

	DECLARE ID_CORRELATIVO INT;
		
	SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;
	

	INSERT INTO transacciones (
		persona_id, 
		usuario_id, 
		transaccion_tipocomprobante, 
		transaccion_seriecomprobante, 
		transaccion_numcomprobante, 
		transaccion_fecha, 
		transaccion_impuesto, 
		transaccion_total, 
		transaccion_estatus, 
		transaccion_porcentaje,
		transaccion_descuento, 
		transaccion_observaciones, 
		transaccion_tipo, 
		id_correlativo) 
	VALUES (
		ID_CLIENTE, 
		ID_USUARIO, 
		'', 
		'', 
		'', 
		NOW(), 
		IMPUESTO, 
		TOTAL, 
		'COTIZADO', 
		PORCENTAJE, 
		DESCUENTO, 
		OBSER, 
		'COTIZACION', 
		CONCAT('COT-0000',@ID_TRANSACCION));

	SELECT LAST_INSERT_ID();	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CREDENCIALES_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CREDENCIALES_PERSONA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_CREDENCIALES_PERSONA`(IN ID_PERSONA INT, IN USERNAME VARCHAR(50), IN CLAVE VARCHAR(255))
BEGIN
	DECLARE	CANTIDAD INT;
	DECLARE ROL VARCHAR(30);
	SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre = USERNAME OR persona_id = ID_PERSONA);
	
	IF @CANTIDAD > 0 THEN
	 SELECT 2;
	ELSE
		SET @ROL:=(SELECT rol_id FROM rol WHERE rol_nombre = 'CLIENTE');
		INSERT INTO usuario(usuario_nombre, usuario_password, persona_id, rol_id, usuario_imagen, usuario_intento, usuario_estatus, usuario_passwordtemp) 
		VALUES (USERNAME, CLAVE, ID_PERSONA, @ROL, 'controlador/usuario/img/user_default.png', 1, 'ACTIVO', 1);
		SELECT 1;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DETALLE_COTIZACION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_COTIZACION`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DETALLE_COTIZACION`(IN ID_COTIZACION INT, 
IN ID_PRODUCTO INT,
IN CANTIDAD DECIMAL(8,2),
IN PRECIO DECIMAL(10,2),
IN DESCUENTO DECIMAL(10,2))
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);

	INSERT INTO detalle_transaccion (
	transaccion_id,
	producto_id, 
	detalletransaccion_cantidad, 
	detalletransaccion_precio, 	
	detalletransaccion_descuento, 
	detalletransaccion_nombrepro, 
	detalletransaccion_estatus)
	VALUES (ID_COTIZACION, ID_PRODUCTO, CANTIDAD, PRECIO, DESCUENTO, @NOMBRE_PRODUCTO, 'COTIZADO');
	
-- 	UPDATE producto SET producto_stock = (producto_stock - CANTIDAD) WHERE producto_id = ID_PRODUCTO;
#SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DETALLE_MOVIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_MOVIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DETALLE_MOVIMIENTO`(IN ID_MOVIMIENTO INT,
	IN ID_PRODUCTO INT,
	IN CANTIDAD INT)
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);

	INSERT INTO detalle_transaccion (transaccion_id, producto_id, detalletransaccion_cantidad, detalletransaccion_precio, detalletransaccion_descuento, detalletransaccion_nombrepro, detalletransaccion_estatus)
	VALUES (ID_MOVIMIENTO, ID_PRODUCTO, CANTIDAD, 0, 0, @NOMBRE_PRODUCTO, 'MOVIMIENTO');
	
	UPDATE producto SET producto_stock = (producto_stock - CANTIDAD) WHERE producto_id = ID_PRODUCTO;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DETALLE_ORDEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_ORDEN`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DETALLE_ORDEN`(IN TRANSACCION INT(11), 
IN VEHICULO INT(11),
IN COMBUSTIBLE VARCHAR(20), 
IN KILOMETRAJE VARCHAR(20), 
IN MECANICO INT(11),
IN OBSER TEXT)
BEGIN

 	INSERT INTO transaccion_vehiculo (id_transaccion, id_vehiculo, nivel_combustible, `vehiculo_km/millas`, id_usuario, descripcion)
 	VALUES (TRANSACCION, VEHICULO, COMBUSTIBLE, KILOMETRAJE, MECANICO, OBSER);
		
	SELECT TRANSACCION;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DETALLE_PRO_SER_ORDEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_PRO_SER_ORDEN`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DETALLE_PRO_SER_ORDEN`(IN ID_COTIZACION INT, 
IN ID_PRODUCTO INT,
IN CANTIDAD DECIMAL(8,2),
IN PRECIO DECIMAL(10,2),
IN DESCUENTO DECIMAL(10,2))
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	DECLARE TIPO_PRODUCTO VARCHAR(100);
	
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	SET @TIPO_PRODUCTO:=(SELECT prod_serv_tipo FROM producto WHERE producto_id = ID_PRODUCTO);
	
	SET @CANTIDAD:=(
		SELECT 
			COUNT(tarea.detalletransaccion_id)
		FROM detalle_transaccion INNER JOIN tarea ON 
		detalle_transaccion.detalletransaccion_id = tarea.detalletransaccion_id
		WHERE detalle_transaccion.transaccion_id = ID_COTIZACION
		AND detalle_transaccion.producto_id = ID_PRODUCTO
	);
	
	
	IF @CANTIDAD = 0 THEN
			INSERT INTO detalle_transaccion (
			transaccion_id,
			producto_id, 
			detalletransaccion_cantidad, 
			detalletransaccion_precio, 	
			detalletransaccion_descuento, 
			detalletransaccion_nombrepro, 
			detalletransaccion_estatus)
		VALUES (ID_COTIZACION, ID_PRODUCTO, CANTIDAD, PRECIO, DESCUENTO, @NOMBRE_PRODUCTO, 'ORDENADO');
		
		
		IF @TIPO_PRODUCTO = 'PRODUCTO' THEN
			UPDATE producto SET producto_stock = (producto_stock - CANTIDAD) WHERE producto_id = ID_PRODUCTO;
		END IF;
	END IF;

	
	

 
#SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DETALLE_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DETALLE_VENTA`(IN ID_VENTA INT, 
IN ID_PRODUCTO INT,
IN CANTIDAD DECIMAL(8,2),
IN PRECIO DECIMAL(10,2),
IN DESCUENTO DECIMAL(10,2))
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);

	INSERT INTO detalle_transaccion (transaccion_id, producto_id, detalletransaccion_cantidad, detalletransaccion_precio, 	detalletransaccion_descuento, detalletransaccion_nombrepro, detalletransaccion_estatus)
	VALUES (ID_VENTA, ID_PRODUCTO, CANTIDAD, PRECIO, DESCUENTO, @NOMBRE_PRODUCTO, 'FACTURADO');
	
	UPDATE producto SET producto_stock = (producto_stock - CANTIDAD) WHERE producto_id = ID_PRODUCTO;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_FABRICANTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_FABRICANTE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_FABRICANTE`(IN FABRICANTE VARCHAR(80), IN DESCRIPCION TEXT)
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM fabricante WHERE fabricante_nombre = FABRICANTE);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO fabricante (fabricante_nombre, fabricante_descripcion, fabricante_estado, fabricante_fregistro
) VALUES (FABRICANTE, DESCRIPCION,'ACTIVO', CURDATE()); 
		SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_INGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INGRESO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_INGRESO`(IN ID_PROVEEDOR INT, 
IN ID_USUARIO INT,
IN TIPO_COMPROBANTE VARCHAR(50), 
IN SERIE_COMPROBANTE VARCHAR(20), 
IN NUM_COMPROBANTE VARCHAR(20),
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN ID_AJUSTE INT,
IN ACCION VARCHAR(15))
BEGIN
	DECLARE ID_TRANSACCION INT;
	DECLARE ID_CORRELATIVO INT;
	DECLARE CANTIDAD_AJ INT;
	DECLARE ID_PRODUCTO_AJ INT;
	DECLARE STOCK_ACTUAL INT;
	DECLARE DETALLE_ID INT;
	DECLARE VAL VARCHAR(3);
	
	IF ACCION = 'AJUSTE' THEN
		UPDATE transacciones SET transaccion_estatus = 'AJUSTE ANULADO' WHERE transaccion_id = ID_AJUSTE;
		SET @CANTIDAD_AJ:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID_AJUSTE);
		
		WHILE @CANTIDAD_AJ > 0 DO
			SET @ID_PRODUCTO_AJ:=(SELECT producto_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'AJUSTE' AND 				transaccion_id = ID_AJUSTE LIMIT 1);
			
			SET @DETALLE_ID:=(SELECT detalletransaccion_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'AJUSTE' AND transaccion_id = ID_AJUSTE LIMIT 1);
			
			SET @STOCK_ACTUAL:=(SELECT producto_stock FROM producto WHERE producto_id = @ID_PRODUCTO_AJ);
			
			UPDATE producto SET producto_stock = @STOCK_ACTUAL-(SELECT detalletransaccion_cantidad FROM detalle_transaccion WHERE 			detalletransaccion_estatus = 'AJUSTE' AND transaccion_id = ID_AJUSTE LIMIT 1) WHERE producto_id = @ID_PRODUCTO_AJ;
			
			UPDATE detalle_transaccion SET detalletransaccion_estatus = 'AJUSTE ANULADO' WHERE detalletransaccion_id = @DETALLE_ID;
			SET @CANTIDAD_AJ:= @CANTIDAD_AJ - 1;
		END WHILE;	
	ELSE
		SET @VAL:='';
	END IF;

SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;

INSERT INTO transacciones (usuario_id, transaccion_tipocomprobante,transaccion_seriecomprobante, transaccion_numcomprobante, transaccion_fecha, transaccion_total, transaccion_impuesto, transaccion_estatus, transaccion_porcentaje, transaccion_tipo, transaccion_descuento, transaccion_observaciones,id_correlativo) 
VALUES (ID_USUARIO, TIPO_COMPROBANTE, SERIE_COMPROBANTE, NUM_COMPROBANTE, NOW(), TOTAL, IMPUESTO, 
IF(TIPO_COMPROBANTE = 'AJUSTE', 'AJUSTE','INGRESADO'), PORCENTAJE, 
IF(TIPO_COMPROBANTE = 'AJUSTE','AJUSTE','INGRESO'), 00.00, '', 
CONCAT(IF(TIPO_COMPROBANTE = 'AJUSTE','AJT-0000','ING-0000'),@ID_TRANSACCION));
		
INSERT INTO transaccion_proveedor VALUES(LAST_INSERT_ID(), ID_PROVEEDOR);	
SELECT LAST_INSERT_ID();	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_INGRESO_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INGRESO_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_INGRESO_DETALLE`(IN ID_INGRESO INT, 
IN ID_PRODUCTO INT,
IN CANTIDAD DECIMAL(8,2),
IN PRECIO DECIMAL(10,2))
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	DECLARE ESTATUS VARCHAR(30);
	
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	SET @ESTATUS:=(SELECT transaccion_estatus FROM transacciones WHERE transaccion_id = ID_INGRESO);

	INSERT INTO detalle_transaccion (transaccion_id, producto_id, detalletransaccion_cantidad, detalletransaccion_precio, detalletransaccion_descuento, detalletransaccion_nombrepro, detalletransaccion_estatus)
	VALUES (ID_INGRESO, ID_PRODUCTO, CANTIDAD, PRECIO, 00.00, @NOMBRE_PRODUCTO, @ESTATUS);
	
	UPDATE producto SET producto_stock = (producto_stock + CANTIDAD) WHERE producto_id = ID_PRODUCTO;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_MARCA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_MARCA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_MARCA`(IN ID_USUARIO_GUARDA INT,
	IN NOMBRE VARCHAR(45),
	IN DESCRIPCION TEXT,
	IN ESTADO VARCHAR(45))
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM marca WHERE marca_nombre = NOMBRE);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO marca (marca_nombre, marca_descripcion, marca_estado) VALUES (NOMBRE, DESCRIPCION, 'ACTIVO');
		
		SELECT 1; #RETORNAMOS EL CUAL SE GUARDO
	ELSE
		SELECT 2; #RETORNAMOS EL CUAL NO SE GUARDO
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_MODELO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_MODELO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_MODELO`(IN ID_USUARIO_GUARDA INT,
	IN NOMBRE VARCHAR(45),
	IN DESCRIPCION TEXT,
	IN ESTADO VARCHAR(45),
	IN ID_MARCA INT)
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM modelo WHERE modelo_nombre = NOMBRE);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO modelo (modelo_nombre, modelo_descripcion, modelo_estado, id_marca) VALUES (NOMBRE, DESCRIPCION, 'ACTIVO', ID_MARCA);
		#INSERT INTO bitacora_marca (accion, fecha_hora, descripcion) VALUES('GUARDAR', NOW(), CONCAT_WS(' ','El usuario con id:', CONVERT(ID_USUARIO_GUARDA,CHAR), 'guardo la marca', NOMBRE));
		SELECT 1; #RETORNAMOS EL CUAL SE GUARDO
	ELSE
		SELECT 2; #RETORNAMOS EL CUAL NO SE GUARDO
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_MOVIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_MOVIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_MOVIMIENTO`(IN OBSERVACION TEXT,
    IN ID_USUARIO INT)
BEGIN
		DECLARE ID_TRANSACCION INT; 
		SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;
			
	INSERT INTO transacciones(id_correlativo, transaccion_tipocomprobante, transaccion_seriecomprobante,transaccion_numcomprobante,transaccion_fecha, transaccion_impuesto, transaccion_total, transaccion_estatus, 							transaccion_descuento, transaccion_porcentaje, transaccion_observaciones, transaccion_tipo, usuario_id)
	VALUES(CONCAT('MOV-0000',@ID_TRANSACCION), '', '', '',NOW(), 0, 0, 'MOVIMIENTO', 0, 0, OBSERVACION, 'MOVIMIENTO', 			ID_USUARIO);	
	
	SELECT LAST_INSERT_ID();
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_ORDEN_TRABAJO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ORDEN_TRABAJO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_ORDEN_TRABAJO`(IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN OBSER TEXT)
BEGIN

	DECLARE ID_CORRELATIVO INT;
		
	SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;
	

	INSERT INTO transacciones (
		persona_id, 
		usuario_id, 
		transaccion_tipocomprobante, 
		transaccion_seriecomprobante, 
		transaccion_numcomprobante, 
		transaccion_fecha, 
		transaccion_impuesto, 
		transaccion_total, 
		transaccion_estatus, 
		transaccion_porcentaje,
		transaccion_descuento, 
		transaccion_observaciones, 
		transaccion_tipo, 
		id_correlativo) 
	VALUES (
		ID_CLIENTE, 
		ID_USUARIO, 
		'', 
		'', 
		'', 
		NOW(), 
		IMPUESTO, 
		TOTAL, 
		'INICIADO', 
		PORCENTAJE, 
		DESCUENTO, 
		OBSER, 
		'ORDEN', 
		CONCAT('ORD-0000',@ID_TRANSACCION));

	SELECT LAST_INSERT_ID();	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PERSONA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PERSONA`(IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17))
BEGIN

	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
	
	IF @CANTIDAD = 0 THEN
		INSERT INTO persona (persona_nombre, persona_apepat, persona_apmat, persona_nrodocumento, persona_tipodocumento, persona_sexo,		persona_telefono, persona_fregistro, persona_estatus) 
		VALUES (NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, N_DOCUMENTO, TIPO_DOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO');
		SELECT 1; #RETORNAMOS
	ELSE
		SELECT 2;
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PRODUCTO`(IN PRODUCTO VARCHAR(150),
IN STOCK_MINIMO INT,
IN CATEGORIA INT,
IN ID_FABRICANTE INT,
IN UNIDAD INT,
IN FOTO VARCHAR(255),
IN PRECIO_COMPRA DECIMAL(10,2),
IN PRECIO DECIMAL(10,2),
IN DESCRIPCION VARCHAR(255),
IN TIPO VARCHAR(20),
IN CODIGO VARCHAR(20))
BEGIN
DECLARE CANTIDAD INT;
DECLARE CANT_CODIGO INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_nombre = PRODUCTO);
SET @CANT_CODIGO:=(SELECT COUNT(*) FROM producto WHERE producto_codigo = CODIGO);


IF @CANTIDAD = 0 THEN
	IF @CANT_CODIGO = 0 THEN
		INSERT INTO producto (producto_nombre, producto_stock,producto_stock_minimo, categoria_id, id_fabricante, unidad_id, 		  		producto_foto,producto_preciocompra, producto_precioventa, producto_estatus, producto_descripcion,prod_serv_tipo,						producto_codigo)
		VALUES (PRODUCTO, 0, STOCK_MINIMO, CATEGORIA,ID_FABRICANTE, UNIDAD, FOTO,PRECIO_COMPRA, PRECIO, 'ACTIVO', DESCRIPCION,				TIPO,CODIGO);
					SELECT 1;
	ELSE
		SELECT 3;
	END IF;
ELSE
	SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PROVEEDOR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROVEEDOR`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PROVEEDOR`(IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17),
	IN RAZON_SOCIAL VARCHAR(255), 
	IN NOMBRE_CONTACTO VARCHAR(100),
	IN NUM_CONTACTO VARCHAR(17),
	IN CORREO VARCHAR(70))
BEGIN

	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_CORREO INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
	SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
	
	IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
		INSERT INTO persona (persona_nombre, persona_apepat, persona_apmat, persona_nrodocumento, persona_tipodocumento, persona_sexo,		persona_telefono, persona_fregistro, persona_estatus, persona_correo) 
		VALUES (NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, N_DOCUMENTO, TIPO_DOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO', CORREO);
		
		INSERT INTO proveedor (proveedor_numcontacto, proveedor_contacto, proveedor_estatus, persona_id, proveedor_razonsocial) 
		VALUES (NUM_CONTACTO, NOMBRE_CONTACTO,'ACTIVO', LAST_INSERT_ID(), RAZON_SOCIAL);
		#LAST_INSERT_ID() = Obtiene el ultimo ID registrado en la tabla persona
		SELECT 1; #RETORNAMOS
	ELSE
			
			IF @CANTIDAD > 0 THEN
				SELECT 2;
			ELSEIF @CANTIDAD_CORREO > 0 THEN
				SELECT 3;
			ELSE
				SELECT 4;
			END IF;
			
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_ROL`(IN ROL_NOMBRE VARCHAR(15))
BEGIN
	
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE rol.rol_nombre = ROL_NOMBRE);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO rol (rol_nombre, rol_feregistro,rol_estatus) VALUES (ROL_NOMBRE, CURDATE(), 'ACTIVO'); #CURDATE () devuelve la fecha actual.
		SELECT 1; #RETORNAMOS
	ELSE
		SELECT 2; #RETORNAMOS
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_SERVICIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_SERVICIO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_SERVICIO`(IN PRODUCTO VARCHAR(150),
IN CATEGORIA INT,
IN FOTO VARCHAR(255),
IN PRECIO DECIMAL(10,2),
IN DESCRIPCION VARCHAR(255),
IN TIPO VARCHAR(20),
IN CODIGO VARCHAR(20))
BEGIN
DECLARE CANTIDAD INT;
DECLARE CANT_CODIGO INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_nombre = PRODUCTO);
SET @CANT_CODIGO:=(SELECT COUNT(*) FROM producto WHERE producto_codigo = CODIGO);


IF @CANTIDAD = 0 THEN
	IF @CANT_CODIGO = 0 THEN
			INSERT INTO producto (producto_nombre, producto_stock,producto_stock_minimo, categoria_id,producto_foto,producto_preciocompra, producto_precioventa, producto_estatus, producto_descripcion,prod_serv_tipo,producto_codigo)
			
		VALUES (PRODUCTO, 0, 0, CATEGORIA, FOTO,0, PRECIO, 'ACTIVO', DESCRIPCION,TIPO,CODIGO);
					SELECT 1;
	ELSE
		SELECT 3;
	END IF;
ELSE
	SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_TAREAS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_TAREAS`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_TAREAS`(IN ID_DTRANSACCION INT,IN FECHA_INICIO DATE, IN FECHA_FIN DATE, IN NOTAS TEXT)
INSERT INTO tarea (fecha_inicio, fecha_fin, estado, detalletransaccion_id, tarea_notas) VALUES (FECHA_INICIO, FECHA_FIN, 'PENDIENTE', ID_DTRANSACCION, NOTAS)
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_UNIDAD_MEDIDA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_UNIDAD_MEDIDA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_UNIDAD_MEDIDA`(IN UNIDAD VARCHAR(100), IN ABREVIATURA CHAR(10))
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM unidad_medida WHERE unidad_nombre = UNIDAD);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO unidad_medida (unidad_nombre, unidad_abreviatura ,unidad_fregistro,unidad_estatus) VALUES (			UNIDAD, ABREVIATURA,CURDATE(), 'ACTIVO'); #CURDATE () devuelve la fecha actual.
		SELECT 1; #RETORNAMOS
	ELSE
		SELECT 2; #RETORNAMOS
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_USUARIO`(IN USUARIO VARCHAR(20),
	IN PASS VARCHAR(250),
	IN EMAIL VARCHAR(70),
	IN ID_ROL INT,
	IN RUTA VARCHAR(250),
	IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17))
BEGIN
DECLARE	CANTIDAD INT;
	SET @CANTIDAD :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre = USUARIO);
	SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = EMAIL OR persona_nrodocumento = N_DOCUMENTO);
	IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
		INSERT INTO persona (persona_nombre, persona_apepat, persona_apmat, persona_nrodocumento, persona_tipodocumento, persona_sexo,persona_telefono, persona_fregistro, persona_estatus, persona_correo) 
		VALUES (NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, N_DOCUMENTO, TIPO_DOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO', EMAIL);
		
		INSERT INTO usuario(usuario_nombre, usuario_password, persona_id, rol_id, usuario_imagen, usuario_intento, usuario_estatus, usuario_passwordtemp) VALUES (USUARIO, PASS, LAST_INSERT_ID(), ID_ROL, RUTA, 1, 'ACTIVO', 0);
		SELECT 1;
	ELSE
		IF @CANTIDAD > 0 THEN
				SELECT 2;
			ELSEIF @CANTIDAD_CORREO > 0 THEN
				SELECT 3;
			ELSE
				SELECT 4;
			END IF;
	END IF;		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_VEHICULO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_VEHICULO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_VEHICULO`(IN PLACA VARCHAR(50),
IN ANIO VARCHAR(4),
IN TRANSMISION VARCHAR(50),
IN COMBUSTIBLE VARCHAR(50),
IN CHASIS VARCHAR(100),
IN MOTOR VARCHAR(50),
IN OBSERVACIONES TEXT,
IN IMAGEN VARCHAR(255),
IN TIPO VARCHAR(50),
IN ESTADO VARCHAR(50),
IN MODELO INT,
IN CLIENTE INT)
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM vehiculo WHERE vehiculo_placa = PLACA);

IF @CANTIDAD = 0 THEN
		INSERT INTO vehiculo(vehiculo_placa, vehiculo_anio, vehiculo_transmision, vehiculo_tipo_combustible, vehiculo_num_chasis, vehiculo_num_motor,vehiculo_observaciones, vehiculo_imagen, vehiculo_tipo, vehiculo_estado, 												id_modelo, id_cliente) 
		VALUES (PLACA,ANIO,TRANSMISION,COMBUSTIBLE,CHASIS,MOTOR,OBSERVACIONES,IMAGEN,TIPO,ESTADO,MODELO,CLIENTE);
		SELECT 1;
ELSE
	SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_VENTA`(IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TIPO_COMPROBANTE VARCHAR(50), 
IN SERIE_COMPROBANTE VARCHAR(20), 
IN NUM_COMPROBANTE VARCHAR(20),
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN CANT_PAGOCLIENTE DECIMAL(10,2))
BEGIN

	DECLARE ID_CORRELATIVO INT;
	DECLARE NUM_FAC_INICIAL VARCHAR(50);
	DECLARE NUM_FAC_TRANSAC VARCHAR(50);
	
	SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;
	SET @NUM_FAC_INICIAL:=(SELECT conf_numero_inicial FROM configuracion);
	SET @NUM_FAC_TRANSAC:=(SELECT COUNT(*) FROM transacciones WHERE transaccion_numcomprobante = @NUM_FAC_INICIAL);
	
	IF @NUM_FAC_TRANSAC > 0 THEN
		INSERT INTO transacciones (persona_id, usuario_id, transaccion_tipocomprobante, transaccion_seriecomprobante, transaccion_numcomprobante, transaccion_fecha, transaccion_impuesto, transaccion_total, transaccion_estatus, transaccion_porcentaje, transaccion_descuento, transaccion_observaciones, transaccion_tipo, id_correlativo, transaccion_cantidadpago) 
		VALUES (ID_CLIENTE, ID_USUARIO, TIPO_COMPROBANTE, SERIE_COMPROBANTE, NUM_COMPROBANTE, NOW(), IMPUESTO, TOTAL, 'FACTURADO', PORCENTAJE, DESCUENTO, '', 'VENTA', CONCAT('FAC-0000',@ID_TRANSACCION), CANT_PAGOCLIENTE);

	SELECT LAST_INSERT_ID();	
	ELSE
		INSERT INTO transacciones (persona_id, usuario_id, transaccion_tipocomprobante, transaccion_seriecomprobante, transaccion_numcomprobante, transaccion_fecha, transaccion_impuesto, transaccion_total, transaccion_estatus, transaccion_porcentaje, transaccion_descuento, transaccion_observaciones, transaccion_tipo, id_correlativo, transaccion_cantidadpago) 
		VALUES (ID_CLIENTE, ID_USUARIO, TIPO_COMPROBANTE, SERIE_COMPROBANTE, @NUM_FAC_INICIAL, NOW(), IMPUESTO, TOTAL, 'FACTURADO', PORCENTAJE, DESCUENTO, '', 'VENTA', CONCAT('FAC-0000',@ID_TRANSACCION), CANT_PAGOCLIENTE);

	SELECT LAST_INSERT_ID();	
	END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REPORTE_MOVIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REPORTE_MOVIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_REPORTE_MOVIMIENTO`(IN ID_TRANSACCION INT)
SELECT t.transaccion_fecha, CONCAT_WS(' ',p.persona_nombre,p.persona_apepat,p.persona_apmat) AS NOMBRE_USUARIO,
	t.transaccion_observaciones, t.id_correlativo, p.persona_nrodocumento, p.persona_tipodocumento, t.transaccion_id
	FROM transacciones t INNER JOIN usuario u on t.usuario_id = u.usuario_id
	INNER JOIN persona p ON p.persona_id = u.persona_id
WHERE t.transaccion_id = ID_TRANSACCION
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_SERIE_COMPROBANTE_INGRESO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SERIE_COMPROBANTE_INGRESO`;
delimiter ;;
CREATE PROCEDURE `SP_SERIE_COMPROBANTE_INGRESO`()
SELECT MAX(transaccion_seriecomprobante) AS SERIE_COMPROBANTE FROM transacciones WHERE transaccion_tipo <> 'VENTA'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_SERIE_COMPROBANTE_VENTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SERIE_COMPROBANTE_VENTA`;
delimiter ;;
CREATE PROCEDURE `SP_SERIE_COMPROBANTE_VENTA`()
SELECT MAX(transaccion_seriecomprobante) AS SERIE_COMPROBANTE FROM transacciones
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TOP10_PRODUCTOS_MENOS_INGRESADOS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TOP10_PRODUCTOS_MENOS_INGRESADOS`;
delimiter ;;
CREATE PROCEDURE `SP_TOP10_PRODUCTOS_MENOS_INGRESADOS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) PRODUCTOS_INGRESADOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON dt.transaccion_id= t.transaccion_id
WHERE t.transaccion_estatus = 'INGRESADO' AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'PRODUCTO'	
GROUP BY dt.producto_id
ORDER BY PRODUCTOS_INGRESADOS ASC
LIMIT 10
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TOP10_PRODUCTOS_MENOS_VENDIDOS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TOP10_PRODUCTOS_MENOS_VENDIDOS`;
delimiter ;;
CREATE PROCEDURE `SP_TOP10_PRODUCTOS_MENOS_VENDIDOS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) PRODUCTOS_VENDIDOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON dt.transaccion_id= t.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'PRODUCTO'	
GROUP BY dt.producto_id
ORDER BY PRODUCTOS_VENDIDOS ASC
LIMIT 10
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TOP10_SERVICIOS_MENOS_SOLIC
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TOP10_SERVICIOS_MENOS_SOLIC`;
delimiter ;;
CREATE PROCEDURE `SP_TOP10_SERVICIOS_MENOS_SOLIC`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT p.producto_nombre, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_SERVICIOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id = dt.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'SERVICIO'
GROUP BY dt.producto_id
ORDER BY CANTIDAD_SERVICIOS ASC
LIMIT 10
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TOP_10_INGRESOS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TOP_10_INGRESOS`;
delimiter ;;
CREATE PROCEDURE `SP_TOP_10_INGRESOS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_PRODUCTOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id= dt.transaccion_id
WHERE t.transaccion_estatus = 'INGRESADO' AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'PRODUCTO'
GROUP BY dt.producto_id
ORDER BY CANTIDAD_PRODUCTOS DESC
LIMIT 10
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TOP_10_SERVICIOS_SOLICITADOS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TOP_10_SERVICIOS_SOLICITADOS`;
delimiter ;;
CREATE PROCEDURE `SP_TOP_10_SERVICIOS_SOLICITADOS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT p.producto_nombre, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_SERVICIOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id = dt.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'SERVICIO'
GROUP BY dt.producto_id
ORDER BY CANTIDAD_SERVICIOS DESC
LIMIT 10
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TOP_10_VENTAS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TOP_10_VENTAS`;
delimiter ;;
CREATE PROCEDURE `SP_TOP_10_VENTAS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_PRODUCTOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id = dt.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'PRODUCTO'
GROUP BY dt.producto_id
ORDER BY CANTIDAD_PRODUCTOS DESC
LIMIT 10
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ULTIMO_NUM_FACTURA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ULTIMO_NUM_FACTURA`;
delimiter ;;
CREATE PROCEDURE `SP_ULTIMO_NUM_FACTURA`()
BEGIN
	DECLARE ULTIMO_ID_TRANSAC INT;
	SET @ULTIMO_ID_TRANSAC:=(SELECT MAX(transaccion_id) FROM transacciones WHERE transaccion_tipo = 'VENTA');
	
	IF @ULTIMO_ID_TRANSAC IS NULL THEN
		SELECT conf_numero_inicial as num_factura, 
		strSplit(conf_numero_inicial, '-',3) + 0 as ultimo_numero
			FROM configuracion; 
	ELSE
		SELECT transaccion_numcomprobante as num_factura, 
		strSplit(transaccion_numcomprobante, '-',3) + 1 as ultimo_numero
		FROM transacciones 
		WHERE transaccion_id = @ULTIMO_ID_TRANSAC;
	END IF;

	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_VERIFICAR_INFOUSUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_VERIFICAR_INFOUSUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_VERIFICAR_INFOUSUARIO`(IN USERNAME VARCHAR(100), IN EMAIL VARCHAR(70))
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario u INNER JOIN persona p ON p.persona_id = u.persona_id WHERE u.usuario_nombre = USERNAME AND p.persona_correo = EMAIL);
	
	IF @CANTIDAD > 0 THEN
	SELECT u.usuario_id FROM usuario u INNER JOIN persona p ON p.persona_id = u.persona_id WHERE u.usuario_nombre = USERNAME AND p.persona_correo = EMAIL;
ELSE
	SELECT 0;
END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_VERIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_VERIFICAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO VARCHAR(20))
SELECT u.usuario_id, u.usuario_nombre, u.usuario_password, u.usuario_intento,
u.usuario_estatus, u.usuario_imagen, u.persona_id, r.rol_nombre, u.usuario_passwordtemp
	FROM usuario u INNER JOIN rol r ON u.rol_id = r.rol_id
WHERE u.usuario_nombre = USUARIO
;;
delimiter ;

-- ----------------------------
-- Function structure for strSplit
-- ----------------------------
DROP FUNCTION IF EXISTS `strSplit`;
delimiter ;;
CREATE FUNCTION `strSplit`(cadena VARCHAR(255), delimitador VARCHAR(12), posicion INT)
 RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
     RETURN ltrim(replace(substring(substring_index(cadena, delimitador, posicion), length(substring_index(cadena, delimitador, posicion - 1)) + 1), delimitador, ''));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_transaccion
-- ----------------------------
DROP TRIGGER IF EXISTS `TRG_ORDER_ANULAR`;
delimiter ;;
CREATE TRIGGER `TRG_ORDER_ANULAR` AFTER UPDATE ON `detalle_transaccion` FOR EACH ROW BEGIN
		
		SET @CANTIDAD:=(OLD.detalletransaccion_cantidad);
		SET @TIPOPRO:=(SELECT producto.prod_serv_tipo From producto WHERE producto.producto_id = OLD.producto_id);
-- 		
-- 		SET @TIPOORD:=(OLD.detalletransaccion_estatus);
		
	
		IF NEW.detalletransaccion_estatus = "ORDEN ANULADA" THEN
			IF @TIPOPRO = "PRODUCTO" THEN
				UPDATE producto SET producto_stock = producto_stock + @CANTIDAD WHERE producto.producto_id = OLD.producto_id;
				
			END IF;
			UPDATE tarea SET tarea.estado = "ORDEN ANULADA" WHERE tarea.detalletransaccion_id = NEW.detalletransaccion_id;
		END IF ;
		
		
		
	END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_transaccion
-- ----------------------------
DROP TRIGGER IF EXISTS `TRG_ORDER_BORRAR_PRODUCTO`;
delimiter ;;
CREATE TRIGGER `TRG_ORDER_BORRAR_PRODUCTO` BEFORE DELETE ON `detalle_transaccion` FOR EACH ROW BEGIN
		
		SET @CANTIDAD:=(OLD.detalletransaccion_cantidad);
		SET @TIPOPRO:=(SELECT producto.prod_serv_tipo From producto WHERE producto.producto_id = OLD.producto_id);
		
		SET @TIPOORD:=(OLD.detalletransaccion_estatus);
	
		IF @TIPOORD = "ORDENADO" THEN
				IF @TIPOPRO = "PRODUCTO" THEN
					UPDATE producto SET producto_stock = producto_stock + @CANTIDAD WHERE producto.producto_id = OLD.producto_id;

				END IF ;
		END IF ;
		
	END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table producto
-- ----------------------------
DROP TRIGGER IF EXISTS `cambio_producto`;
delimiter ;;
CREATE TRIGGER `cambio_producto` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
        IF NEW.producto_nombre <> OLD.producto_nombre OR NEW.producto_precioventa <> OLD.producto_precioventa  THEN  
            INSERT INTO producto_historial(producto_codigo,producto_nombre,producto_nombre_nuevo,				     producto_precio_venta,producto_precio_venta_nuevo,prod_serv_tipo,													fecha_historial) 										
												VALUES(OLD.producto_codigo, OLD.producto_nombre,NEW.producto_nombre,OLD.producto_precioventa,NEW.producto_precioventa,OLD.prod_serv_tipo,NOW());
        END IF;
				 
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
