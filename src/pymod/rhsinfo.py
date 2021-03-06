wp = 'float64'
dim = 2
stencil = 5
order = 4
coefficients = {'ReI': 1, 'kappa': 2, 'gamma_m1': 3, 'Cv': 4, 'U0': 5, 'Cb1': 6, 'Cb2': 7, 'sigma': 8, 'k': 9, 'Cw1': 10, 'Cw2': 11, 'Cw3': 12, 'Cv1': 13, 'Ct1': 14, 'Ct2': 15, 'Ct3': 16, 'Ct4': 17, 'sigmaI': 18, 'esse': 19, 'L_ref': 20, 'sut': 21, 'L': 22, 'gamma': 23, 'Rho0': 24, 'T0': 25, 'P0': 26, 'nut0': 27}
varname = {'rho': 1, 'u': 2, 'v': 3, 'et': 4}
varsolved = ['rho', 'u', 'v', 'et']
varstored = {'d': {'symb': ' d ', 'ind': 1, 'static': True}, 'eta': {'symb': ' eta ', 'ind': 2, 'static': True}, 'ksi': {'symb': ' ksi ', 'ind': 3, 'static': True}, 'stemp': {'symb': '(( (  0.5_wp*( deltayI*( [u]_1y ) - deltaxI*( [v]_1x ) )  )**2 + (  0.5_wp*( deltaxI*( [v]_1x ) - deltayI*( [u]_1y ) )  )**2 )*2)**0.5', 'ind': 4, 'static': False}, 'symm': {'symb': ' ( ( sign(1.0_wp, ksi) - 1.0_wp ) /(-2.0_wp) )', 'ind': 5, 'static': True}, 'detady': {'symb': ' [ eta ]_1y ', 'ind': 6, 'static': True}, 'dksidy': {'symb': ' [ ksi ]_1y ', 'ind': 7, 'static': True}, 'detadx': {'symb': ' [ eta ]_1x ', 'ind': 8, 'static': True}, 'dksidx': {'symb': ' ( [ ksi ]_1x ) ', 'ind': 9, 'static': True}, 'deltaxI': {'symb': ' 1.0_wp / ( dksidx ) ', 'ind': 10, 'static': True}, 'deltayI': {'symb': ' 1.0_wp / ( detady ) ', 'ind': 11, 'static': True}, 'wall': {'symb': ' dabs( 1-symm ) ', 'ind': 12, 'static': True}}
hlo_rhs = 2
bc_info = [{'Low_surf': {'j1': ['q', 'rhs']}, 'Inlet_surf': {'i1': ['q', 'rhs']}, 'Out_surf': {'imax': ['rhs']}, 'Top_surf': {'jmax': ['rhs']}}, {'i1j1': [1], 'i1jmax': [2], 'imaxj1': [3], 'imaxjmax': [4], 'i1': [5], 'imax': [6], 'j1': [7], 'jmax': [8]}]
varbc = {'M_jmax': {'symb': ' ( u/c ) ', 'ind': 1, 'static': False, 'face': 'jmax'}}
