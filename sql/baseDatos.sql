-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 19:15:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juegopreguntas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `idPregunta` int(6) NOT NULL,
  `texto` varchar(250) NOT NULL,
  `nivel` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idPregunta`, `texto`, `nivel`) VALUES
(1, '¿Qué animal es conocido como el rey de los Llanos?', 1),
(2, '¿Qué animal es conocido como el rey de los Llanos?', 1),
(3, '¿Cuál es el baile típico de los Llanos Orientales?', 1),
(4, '¿Qué fruta es típica de Villavicencio?', 1),
(5, '¿Cuál es el principal río que atraviesa Villavicencio?', 1),
(6, '¿En qué país se encuentran los Llanos Orientales?', 1),
(7, '¿Qué producto agrícola es destacado en Meta?', 1),
(8, '¿Cuál es un plato típico llanero?', 1),
(9, '¿Qué bebida es tradicional en los Llanos Orientales?', 1),
(11, '¿Qué río cruza Villavicencio?', 2),
(12, '¿Cuál es el festival más importante de Villavicencio?', 2),
(13, '¿Qué especie de ave es símbolo de los Llanos?', 2),
(14, '¿Cuál es la principal actividad económica en Meta?', 2),
(15, '¿Cuál es el aeropuerto principal de Villavicencio?', 2),
(16, '¿Qué parque natural se encuentra en Meta?', 2),
(17, '¿Qué árbol es característico de los Llanos?', 2),
(18, '¿Qué insecto es muy común en los Llanos?', 2),
(19, '¿Qué significa \"llanero\"?', 2),
(20, '¿Cuál es una de las principales ciudades vecinas de Villavicencio?', 2),
(21, '¿Qué montaña es popular para escalar cerca de Villavicencio?', 3),
(22, '¿Cuál es la importancia de la ganadería en Meta?', 3),
(23, '¿Qué influencia cultural tiene el joropo?', 3),
(24, '¿Cuál es una comida típica en Meta?', 3),
(25, '¿Qué monumento es famoso en Villavicencio?', 3),
(26, '¿Qué mamífero es común en los Llanos?', 3),
(27, '¿Qué deportes son populares en Meta?', 3),
(28, '¿Qué río limita con Meta por el sur?', 3),
(29, '¿Qué influencia tiene la música llanera en la región?', 3),
(30, '¿Qué recurso natural es explotado en los Llanos?', 3),
(31, '¿Qué significa el término \"pajarillo\" en la cultura llanera?', 4),
(32, '¿Cuál es el impacto ambiental de la deforestación en los Llanos?', 4),
(33, '¿Qué papel juega la pesca en la economía de Meta?', 4),
(34, '¿Cuál es la tradición del \"contrapunteo\" en el joropo?', 4),
(35, '¿Qué especies de plantas son endémicas de los Llanos?', 4),
(36, '¿Qué importancia tiene el cacao en Meta?', 4),
(37, '¿Cuál es la historia del Puente de la Reconciliación?', 4),
(38, '¿Qué rol juega el ecoturismo en Meta?', 4),
(39, '¿Qué técnicas de riego se usan en los Llanos?', 4),
(40, '¿Cómo influye el clima en las actividades agrícolas en Meta?', 4),
(41, '¿Cuál es la relación entre la cultura llanera y los caballos?', 5),
(42, '¿Qué impacto tuvo la colonización en los Llanos?', 5),
(43, '¿Qué desafíos enfrentan los agricultores en Meta?', 5),
(44, '¿Cuál es la estructura socioeconómica de Villavicencio?', 5),
(45, '¿Qué medidas se han tomado para conservar los ecosistemas en Meta?', 5),
(46, '¿Cómo ha influido el conflicto armado en los Llanos?', 5),
(47, '¿Qué papel juega la educación en el desarrollo de Meta?', 5),
(48, '¿Qué estrategias se usan para mejorar la ganadería en Meta?', 5),
(49, '¿Qué efectos tienen las inundaciones en la región?', 5),
(50, '¿Cómo contribuyen las ferias y festivales a la economía local?', 5),
(51, '¿Cómo afecta el cambio climático a los Llanos?', 0),
(52, '¿Qué estrategias de sostenibilidad se están implementando en Meta?', 6),
(53, '¿Cuál es la biodiversidad específica de los Llanos?', 6),
(54, '¿Qué proyectos de infraestructura han impactado a Villavicencio?', 6),
(55, '¿Cuál es la historia de la colonización en los Llanos?', 6),
(56, '¿Qué conflictos agrarios han surgido en Meta?', 6),
(57, '¿Cómo se maneja la gestión del agua en los Llanos?', 6),
(58, '¿Qué avances tecnológicos se han implementado en la agricultura de Meta?', 6),
(59, '¿Cuál es el papel de la mujer en la cultura llanera?', 6),
(60, '¿Qué políticas públicas afectan a la economía de Villavicencio?', 6),
(127, '', 1),
(128, '', 1),
(129, '', 0),
(130, '', 0),
(131, '', 0),
(132, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `idRespuesta` int(11) NOT NULL,
  `idPregunta` int(6) NOT NULL,
  `texto` varchar(250) NOT NULL,
  `correcto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`idRespuesta`, `idPregunta`, `texto`, `correcto`) VALUES
(396, 1, 'Villavicencio', 1),
(397, 1, 'Bogotá', 0),
(398, 1, 'Cali', 0),
(399, 1, 'Medellín', 0),
(400, 1, 'Cartagena', 0),
(401, 2, 'El jaguar', 1),
(402, 2, 'El puma', 0),
(403, 2, 'El cóndor', 0),
(404, 2, 'El oso', 0),
(405, 2, 'El águila', 0),
(406, 3, 'El joropo', 1),
(407, 3, 'La cumbia', 0),
(408, 3, 'El vallenato', 0),
(409, 3, 'La salsa', 0),
(410, 3, 'El bambuco', 0),
(411, 4, 'El mango', 1),
(412, 4, 'La manzana', 0),
(413, 4, 'El banano', 0),
(414, 4, 'La papaya', 0),
(415, 4, 'La naranja', 0),
(416, 5, 'Río Guatiquía', 1),
(417, 5, 'Río Meta', 0),
(418, 5, 'Río Cauca', 0),
(419, 5, 'Río Magdalena', 0),
(420, 5, 'Río Sinú', 0),
(421, 6, 'Colombia', 1),
(422, 6, 'Venezuela', 0),
(423, 6, 'Ecuador', 0),
(424, 6, 'Perú', 0),
(425, 6, 'Brasil', 0),
(426, 7, 'El arroz', 1),
(427, 7, 'El maíz', 0),
(428, 7, 'El trigo', 0),
(429, 7, 'La cebada', 0),
(430, 7, 'La avena', 0),
(431, 8, 'El mamona', 1),
(432, 8, 'El sancocho', 0),
(433, 8, 'El ajiaco', 0),
(434, 8, 'La bandeja paisa', 0),
(435, 8, 'El ceviche', 0),
(436, 9, 'La chicha', 1),
(437, 9, 'El guarapo', 0),
(438, 9, 'La limonada', 0),
(439, 9, 'El jugo de caña', 0),
(440, 9, 'El agua de panela', 0),
(446, 11, 'Río Guatiquía', 1),
(447, 11, 'Río Meta', 0),
(448, 11, 'Río Cauca', 0),
(449, 11, 'Río Magdalena', 0),
(450, 11, 'Río Sinú', 0),
(451, 12, 'Festival de la Primavera', 1),
(452, 12, 'Festival del Joropo', 0),
(453, 12, 'Festival Vallenato', 0),
(454, 12, 'Festival de la Salsa', 0),
(455, 12, 'Festival de la Cumbia', 0),
(456, 13, 'El chigüiro', 1),
(457, 13, 'El cóndor', 0),
(458, 13, 'El águila', 0),
(459, 13, 'El tucán', 0),
(460, 13, 'El colibrí', 0),
(461, 14, 'Ganadería', 1),
(462, 14, 'Minería', 0),
(463, 14, 'Pesca', 0),
(464, 14, 'Turismo', 0),
(465, 14, 'Comercio', 0),
(466, 15, 'Aeropuerto Vanguardia', 1),
(467, 15, 'Aeropuerto El Dorado', 0),
(468, 15, 'Aeropuerto José María Córdova', 0),
(469, 15, 'Aeropuerto Alfonso Bonilla Aragón', 0),
(470, 15, 'Aeropuerto Rafael Núñez', 0),
(471, 16, 'Parque Nacional Natural Sierra de La Macarena', 1),
(472, 16, 'Parque Nacional Natural Tayrona', 0),
(473, 16, 'Parque Nacional Natural Sumapaz', 0),
(474, 16, 'Parque Nacional Natural Chingaza', 0),
(475, 16, 'Parque Nacional Natural Los Nevados', 0),
(476, 17, 'El moriche', 1),
(477, 17, 'El ceibo', 0),
(478, 17, 'El roble', 0),
(479, 17, 'El laurel', 0),
(480, 17, 'El nogal', 0),
(481, 18, 'La chicharra', 1),
(482, 18, 'El mosquito', 0),
(483, 18, 'La mariposa', 0),
(484, 18, 'El escarabajo', 0),
(485, 18, 'La hormiga', 0),
(486, 19, 'Habitante de los Llanos', 1),
(487, 19, 'Habitante de las montañas', 0),
(488, 19, 'Habitante de la costa', 0),
(489, 19, 'Habitante de la selva', 0),
(490, 19, 'Habitante del desierto', 0),
(491, 20, 'Bogotá', 1),
(492, 20, 'Medellín', 0),
(493, 20, 'Cali', 0),
(494, 20, 'Cartagena', 0),
(495, 20, 'Barranquilla', 0),
(496, 21, 'Cerro de las Tres Cruces', 1),
(497, 21, 'Cerro de Monserrate', 0),
(498, 21, 'Pico Cristóbal Colón', 0),
(499, 21, 'Nevado del Ruiz', 0),
(500, 21, 'Cerro de Guadalupe', 0),
(501, 22, 'Es una de las principales actividades económicas', 1),
(502, 22, 'No es importante', 0),
(503, 22, 'Es una actividad menor', 0),
(504, 22, 'Es irrelevante', 0),
(505, 22, 'Es secundaria', 0),
(506, 23, 'Representa la cultura y tradiciones de la región', 1),
(507, 23, 'No tiene influencia', 0),
(508, 23, 'Es una danza extranjera', 0),
(509, 23, 'Es un baile urbano', 0),
(510, 23, 'No se conoce', 0),
(511, 24, 'Ternera a la llanera', 1),
(512, 24, 'Arepas', 0),
(513, 24, 'Bandeja paisa', 0),
(514, 24, 'Ajiaco', 0),
(515, 24, 'Tamales', 0),
(516, 25, 'Monumento a Cristo Rey', 1),
(517, 25, 'Monumento a los Comuneros', 0),
(518, 25, 'Monumento a la Raza', 0),
(519, 25, 'Monumento a Bolívar', 0),
(520, 25, 'Monumento a la Independencia', 0),
(521, 26, 'El chigüiro', 1),
(522, 26, 'El jaguar', 0),
(523, 26, 'El oso hormiguero', 0),
(524, 26, 'La danta', 0),
(525, 26, 'El armadillo', 0),
(526, 27, 'Fútbol y coleo', 1),
(527, 27, 'Basketball y rugby', 0),
(528, 27, 'Tenis y natación', 0),
(529, 27, 'Voleibol y atletismo', 0),
(530, 27, 'Ciclismo y béisbol', 0),
(531, 28, 'Río Guaviare', 1),
(532, 28, 'Río Arauca', 0),
(533, 28, 'Río Orinoco', 0),
(534, 28, 'Río Vaupés', 0),
(535, 28, 'Río Putumayo', 0),
(536, 29, 'Es fundamental para la identidad cultural', 1),
(537, 29, 'Tiene poca influencia', 0),
(538, 29, 'Es irrelevante', 0),
(539, 29, 'Es una influencia menor', 0),
(540, 29, 'No tiene importancia', 0),
(541, 30, 'Petróleo', 1),
(542, 30, 'Gas', 0),
(543, 30, 'Carbón', 0),
(544, 30, 'Oro', 0),
(545, 30, 'Plata', 0),
(546, 31, 'Una especie de ave', 1),
(547, 31, 'Un género musical', 0),
(548, 31, 'Un tipo de planta', 0),
(549, 31, 'Una festividad', 0),
(550, 31, 'Un baile típico', 0),
(551, 32, 'Desastroso', 1),
(552, 32, 'Moderado', 0),
(553, 32, 'Bajo', 0),
(554, 32, 'Insignificante', 0),
(555, 32, 'Nulo', 0),
(556, 33, 'Significativo', 1),
(557, 33, 'Bajo', 0),
(558, 33, 'Nulo', 0),
(559, 33, 'Moderado', 0),
(560, 33, 'Desconocido', 0),
(561, 34, 'Competencia verbal en verso', 1),
(562, 34, 'Una forma de baile', 0),
(563, 34, 'Un estilo de canto', 0),
(564, 34, 'Una reunión social', 0),
(565, 34, 'Una festividad', 0),
(566, 35, 'Moriche', 1),
(567, 35, 'Nogal', 0),
(568, 35, 'Roble', 0),
(569, 35, 'Laurel', 0),
(570, 35, 'Ceibo', 0),
(571, 36, 'Alta importancia económica', 1),
(572, 36, 'Moderada importancia', 0),
(573, 36, 'Baja importancia', 0),
(574, 36, 'No tiene importancia', 0),
(575, 36, 'Es irrelevante', 0),
(576, 37, 'Conmemora la paz', 1),
(577, 37, 'Conmemora la guerra', 0),
(578, 37, 'Conmemora la independencia', 0),
(579, 37, 'Conmemora la colonización', 0),
(580, 37, 'Conmemora la revolución', 0),
(581, 38, 'Alto', 1),
(582, 38, 'Moderado', 0),
(583, 38, 'Bajo', 0),
(584, 38, 'Nulo', 0),
(585, 38, 'Desconocido', 0),
(586, 39, 'Riego por aspersión', 1),
(587, 39, 'Riego por goteo', 0),
(588, 39, 'Riego por inundación', 0),
(589, 39, 'Riego subterráneo', 0),
(590, 39, 'Riego aéreo', 0),
(591, 40, 'Significativamente', 1),
(592, 40, 'Moderadamente', 0),
(593, 40, 'Poco', 0),
(594, 40, 'No influye', 0),
(595, 40, 'Desconocido', 0),
(596, 41, 'Muy estrecha', 1),
(597, 41, 'Moderada', 0),
(598, 41, 'Leve', 0),
(599, 41, 'Nula', 0),
(600, 41, 'Desconocida', 0),
(601, 42, 'Transformador', 1),
(602, 42, 'Moderado', 0),
(603, 42, 'Mínimo', 0),
(604, 42, 'Inexistente', 0),
(605, 42, 'Desconocido', 0),
(606, 43, 'Climáticos y económicos', 1),
(607, 43, 'Solo climáticos', 0),
(608, 43, 'Solo económicos', 0),
(609, 43, 'Sociales', 0),
(610, 43, 'Culturales', 0),
(611, 44, 'Diversificada con énfasis en agricultura y servicios', 1),
(612, 44, 'Principalmente industrial', 0),
(613, 44, 'Principalmente turística', 0),
(614, 44, 'Principalmente minera', 0),
(615, 44, 'Principalmente pesquera', 0),
(616, 45, 'Implementación de reservas y parques naturales', 1),
(617, 45, 'Prohibición de la minería', 0),
(618, 45, 'Reducción de la agricultura', 0),
(619, 45, 'Desalojos forzosos', 0),
(620, 45, 'Desconocido', 0),
(621, 46, 'Negativamente, creando desplazamiento y violencia', 1),
(622, 46, 'Positivamente, mejorando la economía', 0),
(623, 46, 'No ha tenido influencia', 0),
(624, 46, 'Moderadamente, con algunos impactos', 0),
(625, 46, 'Desconocido', 0),
(626, 47, 'Es clave para el progreso y desarrollo', 1),
(627, 47, 'Tiene poca importancia', 0),
(628, 47, 'Es irrelevante', 0),
(629, 47, 'Es moderadamente importante', 0),
(630, 47, 'No se considera', 0),
(631, 48, 'Mejoras en técnicas de cría y pastoreo', 1),
(632, 48, 'Reducción de cabezas de ganado', 0),
(633, 48, 'Aumento del uso de fertilizantes', 0),
(634, 48, 'Importación de razas extranjeras', 0),
(635, 48, 'Desconocido', 0),
(636, 49, 'Pérdidas económicas y desplazamientos', 1),
(637, 49, 'No tienen efectos', 0),
(638, 49, 'Beneficios ambientales', 0),
(639, 49, 'Mejora de la agricultura', 0),
(640, 49, 'Desconocido', 0),
(641, 50, 'Positivamente, dinamizando la economía local', 1),
(642, 50, 'Negativamente, causando desorden', 0),
(643, 50, 'Neutralmente', 0),
(644, 50, 'No tienen efecto', 0),
(645, 50, 'Desconocido', 0),
(646, 51, 'Aumento de temperaturas y cambios en patrones de lluvia', 1),
(647, 51, 'No tiene efecto', 0),
(648, 51, 'Mejoras en el clima', 0),
(649, 51, 'Incremento de nevadas', 0),
(650, 51, 'Desconocido', 0),
(651, 52, 'Fomento de energías renovables y conservación de bosques', 1),
(652, 52, 'Aumento de la deforestación', 0),
(653, 52, 'Mayor uso de combustibles fósiles', 0),
(654, 52, 'Expansión urbana descontrolada', 0),
(655, 52, 'Desconocido', 0),
(656, 53, 'Alta con múltiples especies endémicas', 1),
(657, 53, 'Baja', 0),
(658, 53, 'Moderada', 0),
(659, 53, 'Nula', 0),
(660, 53, 'Desconocido', 0),
(661, 54, 'Mejoras en infraestructura vial y aeroportuaria', 1),
(662, 54, 'No ha habido impactos', 0),
(663, 54, 'Reducción de infraestructura', 0),
(664, 54, 'Destrucción de infraestructuras existentes', 0),
(665, 54, 'Desconocido', 0),
(666, 55, 'Proceso de asentamiento y desarrollo en el siglo XIX', 1),
(667, 55, 'Conflictos constantes con nativos', 0),
(668, 55, 'No hubo colonización', 0),
(669, 55, 'Colonización en el siglo XVIII', 0),
(670, 55, 'Desconocido', 0),
(671, 56, 'Disputas por la tierra y derechos de propiedad', 1),
(672, 56, 'No ha habido conflictos', 0),
(673, 56, 'Conflictos con invasores extranjeros', 0),
(674, 56, 'Desconocido', 0),
(675, 56, 'Conflictos religiosos', 0),
(676, 57, 'Uso de tecnologías avanzadas para riego y almacenamiento', 1),
(677, 57, 'Desperdicio constante', 0),
(678, 57, 'Falta de gestión', 0),
(679, 57, 'Uso de métodos tradicionales únicamente', 0),
(680, 57, 'Desconocido', 0),
(681, 58, 'Implementación de maquinaria moderna y técnicas de cultivo eficientes', 1),
(682, 58, 'Uso exclusivo de métodos tradicionales', 0),
(683, 58, 'Retroceso tecnológico', 0),
(684, 58, 'Ausencia de tecnología', 0),
(685, 58, 'Desconocido', 0),
(686, 59, 'Fundamental en la transmisión de cultura y tradiciones', 1),
(687, 59, 'Poco relevante', 0),
(688, 59, 'Sin influencia', 0),
(689, 59, 'Irrelevante', 0),
(690, 59, 'Desconocido', 0),
(691, 60, 'Desarrollo de políticas de incentivo económico y social', 1),
(692, 60, 'Poco impacto de políticas públicas', 0),
(693, 60, 'Políticas de reducción económica', 0),
(694, 60, 'Ausencia de políticas públicas', 0),
(695, 60, 'Desconocido', 0),
(861, 127, 'nnnnnnnnnnnn', 1),
(862, 127, '', 0),
(863, 127, '', 0),
(864, 127, '', 0),
(865, 127, '', 0),
(866, 128, '', 1),
(867, 128, '', 0),
(868, 128, '', 0),
(869, 128, '', 0),
(870, 128, '', 0),
(871, 129, '', 1),
(872, 129, '', 0),
(873, 129, '', 0),
(874, 129, '', 0),
(875, 129, '', 0),
(876, 130, '', 1),
(877, 130, '', 0),
(878, 130, '', 0),
(879, 130, '', 0),
(880, 130, '', 0),
(881, 131, '', 1),
(882, 131, '', 0),
(883, 131, '', 0),
(884, 131, '', 0),
(885, 131, '', 0),
(886, 132, '', 1),
(887, 132, '', 0),
(888, 132, '', 0),
(889, 132, '', 0),
(890, 132, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`) VALUES
(1, 'admin', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`idPregunta`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`idRespuesta`),
  ADD KEY `fk_pregunta_respuesta` (`idPregunta`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idPregunta` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `idRespuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=891;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_pregunta_respuesta` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;