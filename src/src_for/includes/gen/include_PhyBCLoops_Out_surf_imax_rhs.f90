

!***********************************************************
!                                                           
! Start building layers for BC : imax None None ************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: 0 None None ************************************
!                                                           
!***********************************************************


     do j=idloop(3),idloop(4) 


!***********************************************************
!                                                           
! building source terms in RHS for layer 0 None None d(rho)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([rho*u]_1x)+deltayI*([rho*v]_1y)+(1.0_wp/c**2*((u*(-c**2*[rho]_1x+1.0_wp*[p]_1x))*deltaxI+0.5_wp*(((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI+-((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI)))
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_rhs_rho_dx_0_nxp2p0p0jk = q(nx+2+0+0,j,indvars(1))*q(nx+2+0+0,j,indvars(2))

d1_rhs_rho_dx_0_nxp2p0m1jk = q(nx+2+0-1,j,indvars(1))*q(nx+2+0-1,j,indvars(2))

d1_rhs_rho_dx_0_nxp2p0m2jk = q(nx+2+0-2,j,indvars(1))*q(nx+2+0-2,j,indvars(2))

d1_rhs_rho_dx_0_nxp2p0jk = 1.5_wp*d1_rhs_rho_dx_0_nxp2p0p0jk-&
          2.0_wp*d1_rhs_rho_dx_0_nxp2p0m1jk+&
          0.5_wp*d1_rhs_rho_dx_0_nxp2p0m2jk

d1_rhs_rho_dx_0_nxp2p0jk = d1_rhs_rho_dx_0_nxp2p0jk*param_float(1)

d1_rhs_rho_dx_1_nxp2p0p0jk = q(nx+2+0+0,j,indvars(1))

d1_rhs_rho_dx_1_nxp2p0m1jk = q(nx+2+0-1,j,indvars(1))

d1_rhs_rho_dx_1_nxp2p0m2jk = q(nx+2+0-2,j,indvars(1))

d1_rhs_rho_dx_1_nxp2p0jk = 1.5_wp*d1_rhs_rho_dx_1_nxp2p0p0jk-&
          2.0_wp*d1_rhs_rho_dx_1_nxp2p0m1jk+&
          0.5_wp*d1_rhs_rho_dx_1_nxp2p0m2jk

d1_rhs_rho_dx_1_nxp2p0jk = d1_rhs_rho_dx_1_nxp2p0jk*param_float(1)

d1_rhs_rho_dx_2_nxp2p0p0jk = (param_float(3 + 5))*q(nx+2+0+0,j,indvars(1))*((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))

d1_rhs_rho_dx_2_nxp2p0m1jk = (param_float(3 + 5))*q(nx+2+0-1,j,indvars(1))*((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))

d1_rhs_rho_dx_2_nxp2p0m2jk = (param_float(3 + 5))*q(nx+2+0-2,j,indvars(1))*((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))

d1_rhs_rho_dx_2_nxp2p0jk = 1.5_wp*d1_rhs_rho_dx_2_nxp2p0p0jk-&
          2.0_wp*d1_rhs_rho_dx_2_nxp2p0m1jk+&
          0.5_wp*d1_rhs_rho_dx_2_nxp2p0m2jk

d1_rhs_rho_dx_2_nxp2p0jk = d1_rhs_rho_dx_2_nxp2p0jk*param_float(1)

d1_rhs_rho_dx_3_nxp2p0p0jk = q(nx+2+0+0,j,indvars(2))

d1_rhs_rho_dx_3_nxp2p0m1jk = q(nx+2+0-1,j,indvars(2))

d1_rhs_rho_dx_3_nxp2p0m2jk = q(nx+2+0-2,j,indvars(2))

d1_rhs_rho_dx_3_nxp2p0jk = 1.5_wp*d1_rhs_rho_dx_3_nxp2p0p0jk-&
          2.0_wp*d1_rhs_rho_dx_3_nxp2p0m1jk+&
          0.5_wp*d1_rhs_rho_dx_3_nxp2p0m2jk

d1_rhs_rho_dx_3_nxp2p0jk = d1_rhs_rho_dx_3_nxp2p0jk*param_float(1)

d1_rhs_rho_dy_0_nxp2p0jm1k = q(nx+2+0,j-1,indvars(1))*q(nx+2+0,j-1,indvars(3))

d1_rhs_rho_dy_0_nxp2p0jp1k = q(nx+2+0,j+1,indvars(1))*q(nx+2+0,j+1,indvars(3))

d1_rhs_rho_dy_0_nxp2p0jk = -&
          0.5_wp*d1_rhs_rho_dy_0_nxp2p0jm1k+&
          0.5_wp*d1_rhs_rho_dy_0_nxp2p0jp1k

d1_rhs_rho_dy_0_nxp2p0jk = d1_rhs_rho_dy_0_nxp2p0jk*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 None None d(rho)/dt **********
!                                                           
!***********************************************************


rhs(nx+2+0,j,indvars(1)) =   -  ( qst(nx+2+0,j,indvarsst(10))*(d1_rhs_rho_dx_0_nxp2p0jk)+&
                    qst(nx+2+0,j,indvarsst(11))*(d1_rhs_rho_dy_0_nxp2p0jk)+&
                    (1.0_wp/(param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))**2*((q(nx+2+0,j,indvars(2))*(-&
                    (param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))**2*d1_rhs_rho_dx_1_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    0.5_wp*((((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    -&
                    (((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))))) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 None None d(rho u)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! u*(1.0_wp/c**2*((u*(-c**2*[rho]_1x+1.0_wp*[p]_1x))*deltaxI+0.5_wp*(((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI+-((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI)))+rho*(1.0_wp/(2*rho*c)*(((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI--((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI))+[rho*u*v]_1y+deltaxI*([-visc_t*(2.0_wp*deltaxI*({u}_1x)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y)))]_1x)+deltayI*([-visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_rhs_u_dxdx_10_0_nxp2p0p0jk_nxp2p0p0p0jk = q(nx+2+0+0+0,j,indvars(2))

d2_rhs_u_dxdx_10_0_nxp2p0p0jk_nxp2p0p0m1jk = q(nx+2+0+0-1,j,indvars(2))

d2_rhs_u_dxdx_10_0_nxp2p0p0jk_nxp2p0p0m2jk = q(nx+2+0+0-2,j,indvars(2))

d2_rhs_u_dxdx_10_0_nxp2p0p0jk = 1.5_wp*d2_rhs_u_dxdx_10_0_nxp2p0p0jk_nxp2p0p0p0jk-&
          2.0_wp*d2_rhs_u_dxdx_10_0_nxp2p0p0jk_nxp2p0p0m1jk+&
          0.5_wp*d2_rhs_u_dxdx_10_0_nxp2p0p0jk_nxp2p0p0m2jk

d2_rhs_u_dxdx_10_0_nxp2p0p0jk = d2_rhs_u_dxdx_10_0_nxp2p0p0jk*param_float(1)

d2_rhs_u_dxdx_10_0_nxp2p0m1jk_nxp2p0m1m1jk = q(nx+2+0-1-1,j,indvars(2))

d2_rhs_u_dxdx_10_0_nxp2p0m1jk_nxp2p0m1p1jk = q(nx+2+0-1+1,j,indvars(2))

d2_rhs_u_dxdx_10_0_nxp2p0m1jk = -&
          0.5_wp*d2_rhs_u_dxdx_10_0_nxp2p0m1jk_nxp2p0m1m1jk+&
          0.5_wp*d2_rhs_u_dxdx_10_0_nxp2p0m1jk_nxp2p0m1p1jk

d2_rhs_u_dxdx_10_0_nxp2p0m1jk = d2_rhs_u_dxdx_10_0_nxp2p0m1jk*param_float(1)

d2_rhs_u_dxdx_10_0_nxp2p0m2jk_nxp2p0m2m1jk = q(nx+2+0-2-1,j,indvars(2))

d2_rhs_u_dxdx_10_0_nxp2p0m2jk_nxp2p0m2p1jk = q(nx+2+0-2+1,j,indvars(2))

d2_rhs_u_dxdx_10_0_nxp2p0m2jk = -&
          0.5_wp*d2_rhs_u_dxdx_10_0_nxp2p0m2jk_nxp2p0m2m1jk+&
          0.5_wp*d2_rhs_u_dxdx_10_0_nxp2p0m2jk_nxp2p0m2p1jk

d2_rhs_u_dxdx_10_0_nxp2p0m2jk = d2_rhs_u_dxdx_10_0_nxp2p0m2jk*param_float(1)

d2_rhs_u_dxdy_10_0_nxp2p0p0jk_nxp2p0p0jm1k = q(nx+2+0+0,j-1,indvars(3))

d2_rhs_u_dxdy_10_0_nxp2p0p0jk_nxp2p0p0jp1k = q(nx+2+0+0,j+1,indvars(3))

d2_rhs_u_dxdy_10_0_nxp2p0p0jk = -&
          0.5_wp*d2_rhs_u_dxdy_10_0_nxp2p0p0jk_nxp2p0p0jm1k+&
          0.5_wp*d2_rhs_u_dxdy_10_0_nxp2p0p0jk_nxp2p0p0jp1k

d2_rhs_u_dxdy_10_0_nxp2p0p0jk = d2_rhs_u_dxdy_10_0_nxp2p0p0jk*param_float(2)

d2_rhs_u_dxdy_10_0_nxp2p0m1jk_nxp2p0m1jm1k = q(nx+2+0-1,j-1,indvars(3))

d2_rhs_u_dxdy_10_0_nxp2p0m1jk_nxp2p0m1jp1k = q(nx+2+0-1,j+1,indvars(3))

d2_rhs_u_dxdy_10_0_nxp2p0m1jk = -&
          0.5_wp*d2_rhs_u_dxdy_10_0_nxp2p0m1jk_nxp2p0m1jm1k+&
          0.5_wp*d2_rhs_u_dxdy_10_0_nxp2p0m1jk_nxp2p0m1jp1k

d2_rhs_u_dxdy_10_0_nxp2p0m1jk = d2_rhs_u_dxdy_10_0_nxp2p0m1jk*param_float(2)

d2_rhs_u_dxdy_10_0_nxp2p0m2jk_nxp2p0m2jm1k = q(nx+2+0-2,j-1,indvars(3))

d2_rhs_u_dxdy_10_0_nxp2p0m2jk_nxp2p0m2jp1k = q(nx+2+0-2,j+1,indvars(3))

d2_rhs_u_dxdy_10_0_nxp2p0m2jk = -&
          0.5_wp*d2_rhs_u_dxdy_10_0_nxp2p0m2jk_nxp2p0m2jm1k+&
          0.5_wp*d2_rhs_u_dxdy_10_0_nxp2p0m2jk_nxp2p0m2jp1k

d2_rhs_u_dxdy_10_0_nxp2p0m2jk = d2_rhs_u_dxdy_10_0_nxp2p0m2jk*param_float(2)

d1_rhs_u_dx_10_nxp2p0p0jk = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0+0,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0p0jk)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0+0,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0p0jk)+&
                    qst(nx+2+0+0,j,indvarsst(11))*(d2_rhs_u_dxdy_10_0_nxp2p0p0jk)))

d1_rhs_u_dx_10_nxp2p0m1jk = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0-1,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0m1jk)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0-1,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0m1jk)+&
                    qst(nx+2+0-1,j,indvarsst(11))*(d2_rhs_u_dxdy_10_0_nxp2p0m1jk)))

d1_rhs_u_dx_10_nxp2p0m2jk = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0-2,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0m2jk)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0-2,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0m2jk)+&
                    qst(nx+2+0-2,j,indvarsst(11))*(d2_rhs_u_dxdy_10_0_nxp2p0m2jk)))

d1_rhs_u_dx_10_nxp2p0jk = 1.5_wp*d1_rhs_u_dx_10_nxp2p0p0jk-&
          2.0_wp*d1_rhs_u_dx_10_nxp2p0m1jk+&
          0.5_wp*d1_rhs_u_dx_10_nxp2p0m2jk

d1_rhs_u_dx_10_nxp2p0jk = d1_rhs_u_dx_10_nxp2p0jk*param_float(1)

d1_rhs_u_dy_0_nxp2p0jm1k = q(nx+2+0,j-1,indvars(1))*q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(3))

d1_rhs_u_dy_0_nxp2p0jp1k = q(nx+2+0,j+1,indvars(1))*q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(3))

d1_rhs_u_dy_0_nxp2p0jk = -&
          0.5_wp*d1_rhs_u_dy_0_nxp2p0jm1k+&
          0.5_wp*d1_rhs_u_dy_0_nxp2p0jp1k

d1_rhs_u_dy_0_nxp2p0jk = d1_rhs_u_dy_0_nxp2p0jk*param_float(2)

d2_rhs_u_dydx_1_0_nxp2p0jm1k_nxp2p0p0jm1k = q(nx+2+0+0,j-1,indvars(3))

d2_rhs_u_dydx_1_0_nxp2p0jm1k_nxp2p0m1jm1k = q(nx+2+0-1,j-1,indvars(3))

d2_rhs_u_dydx_1_0_nxp2p0jm1k_nxp2p0m2jm1k = q(nx+2+0-2,j-1,indvars(3))

d2_rhs_u_dydx_1_0_nxp2p0jm1k = 1.5_wp*d2_rhs_u_dydx_1_0_nxp2p0jm1k_nxp2p0p0jm1k-&
          2.0_wp*d2_rhs_u_dydx_1_0_nxp2p0jm1k_nxp2p0m1jm1k+&
          0.5_wp*d2_rhs_u_dydx_1_0_nxp2p0jm1k_nxp2p0m2jm1k

d2_rhs_u_dydx_1_0_nxp2p0jm1k = d2_rhs_u_dydx_1_0_nxp2p0jm1k*param_float(1)

d2_rhs_u_dydx_1_0_nxp2p0jp1k_nxp2p0p0jp1k = q(nx+2+0+0,j+1,indvars(3))

d2_rhs_u_dydx_1_0_nxp2p0jp1k_nxp2p0m1jp1k = q(nx+2+0-1,j+1,indvars(3))

d2_rhs_u_dydx_1_0_nxp2p0jp1k_nxp2p0m2jp1k = q(nx+2+0-2,j+1,indvars(3))

d2_rhs_u_dydx_1_0_nxp2p0jp1k = 1.5_wp*d2_rhs_u_dydx_1_0_nxp2p0jp1k_nxp2p0p0jp1k-&
          2.0_wp*d2_rhs_u_dydx_1_0_nxp2p0jp1k_nxp2p0m1jp1k+&
          0.5_wp*d2_rhs_u_dydx_1_0_nxp2p0jp1k_nxp2p0m2jp1k

d2_rhs_u_dydx_1_0_nxp2p0jp1k = d2_rhs_u_dydx_1_0_nxp2p0jp1k*param_float(1)

d2_rhs_u_dydy_1_0_nxp2p0jm1k_nxp2p0jm1m1k = q(nx+2+0,j-1-1,indvars(2))

d2_rhs_u_dydy_1_0_nxp2p0jm1k_nxp2p0jm1p1k = q(nx+2+0,j-1+1,indvars(2))

d2_rhs_u_dydy_1_0_nxp2p0jm1k = -&
          0.5_wp*d2_rhs_u_dydy_1_0_nxp2p0jm1k_nxp2p0jm1m1k+&
          0.5_wp*d2_rhs_u_dydy_1_0_nxp2p0jm1k_nxp2p0jm1p1k

d2_rhs_u_dydy_1_0_nxp2p0jm1k = d2_rhs_u_dydy_1_0_nxp2p0jm1k*param_float(2)

d2_rhs_u_dydy_1_0_nxp2p0jp1k_nxp2p0jp1m1k = q(nx+2+0,j+1-1,indvars(2))

d2_rhs_u_dydy_1_0_nxp2p0jp1k_nxp2p0jp1p1k = q(nx+2+0,j+1+1,indvars(2))

d2_rhs_u_dydy_1_0_nxp2p0jp1k = -&
          0.5_wp*d2_rhs_u_dydy_1_0_nxp2p0jp1k_nxp2p0jp1m1k+&
          0.5_wp*d2_rhs_u_dydy_1_0_nxp2p0jp1k_nxp2p0jp1p1k

d2_rhs_u_dydy_1_0_nxp2p0jp1k = d2_rhs_u_dydy_1_0_nxp2p0jp1k*param_float(2)

d1_rhs_u_dy_1_nxp2p0jm1k = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0,j-1,indvarsst(11))*(d2_rhs_u_dydy_1_0_nxp2p0jm1k)+&
                    qst(nx+2+0,j-1,indvarsst(10))*(d2_rhs_u_dydx_1_0_nxp2p0jm1k))

d1_rhs_u_dy_1_nxp2p0jp1k = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0,j+1,indvarsst(11))*(d2_rhs_u_dydy_1_0_nxp2p0jp1k)+&
                    qst(nx+2+0,j+1,indvarsst(10))*(d2_rhs_u_dydx_1_0_nxp2p0jp1k))

d1_rhs_u_dy_1_nxp2p0jk = -&
          0.5_wp*d1_rhs_u_dy_1_nxp2p0jm1k+&
          0.5_wp*d1_rhs_u_dy_1_nxp2p0jp1k

d1_rhs_u_dy_1_nxp2p0jk = d1_rhs_u_dy_1_nxp2p0jk*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 None None d(rho u)/dt ********
!                                                           
!***********************************************************


rhs(nx+2+0,j,indvars(2)) =   -  ( q(nx+2+0,j,indvars(2))*(1.0_wp/(param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))**2*((q(nx+2+0,j,indvars(2))*(-&
                    (param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))**2*d1_rhs_rho_dx_1_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    0.5_wp*((((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    -&
                    (((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10)))))+&
                    q(nx+2+0,j,indvars(1))*(1.0_wp/(2*q(nx+2+0,j,indvars(1))*(param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1))))*((((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))-&
                    -&
                    (((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))))+&
                    d1_rhs_u_dy_0_nxp2p0jk+&
                    qst(nx+2+0,j,indvarsst(10))*(d1_rhs_u_dx_10_nxp2p0jk)+&
                    qst(nx+2+0,j,indvarsst(11))*(d1_rhs_u_dy_1_nxp2p0jk) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 None None d(rho v)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! v*(1.0_wp/c**2*((u*(-c**2*[rho]_1x+1.0_wp*[p]_1x))*deltaxI+0.5_wp*(((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI+-((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI)))+rho*((1.0_wp*u*[v]_1x)*deltaxI)+[rho*v*v]_1y+deltaxI*([-visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x))]_1x)+deltayI*([-visc_t*(2.0_wp*deltayI*({v}_1y)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y)))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_rhs_v_dx_6_nxp2p0p0jk = q(nx+2+0+0,j,indvars(3))

d1_rhs_v_dx_6_nxp2p0m1jk = q(nx+2+0-1,j,indvars(3))

d1_rhs_v_dx_6_nxp2p0m2jk = q(nx+2+0-2,j,indvars(3))

d1_rhs_v_dx_6_nxp2p0jk = 1.5_wp*d1_rhs_v_dx_6_nxp2p0p0jk-&
          2.0_wp*d1_rhs_v_dx_6_nxp2p0m1jk+&
          0.5_wp*d1_rhs_v_dx_6_nxp2p0m2jk

d1_rhs_v_dx_6_nxp2p0jk = d1_rhs_v_dx_6_nxp2p0jk*param_float(1)

d2_rhs_v_dxdx_7_0_nxp2p0p0jk_nxp2p0p0p0jk = q(nx+2+0+0+0,j,indvars(3))

d2_rhs_v_dxdx_7_0_nxp2p0p0jk_nxp2p0p0m1jk = q(nx+2+0+0-1,j,indvars(3))

d2_rhs_v_dxdx_7_0_nxp2p0p0jk_nxp2p0p0m2jk = q(nx+2+0+0-2,j,indvars(3))

d2_rhs_v_dxdx_7_0_nxp2p0p0jk = 1.5_wp*d2_rhs_v_dxdx_7_0_nxp2p0p0jk_nxp2p0p0p0jk-&
          2.0_wp*d2_rhs_v_dxdx_7_0_nxp2p0p0jk_nxp2p0p0m1jk+&
          0.5_wp*d2_rhs_v_dxdx_7_0_nxp2p0p0jk_nxp2p0p0m2jk

d2_rhs_v_dxdx_7_0_nxp2p0p0jk = d2_rhs_v_dxdx_7_0_nxp2p0p0jk*param_float(1)

d2_rhs_v_dxdx_7_0_nxp2p0m1jk_nxp2p0m1m1jk = q(nx+2+0-1-1,j,indvars(3))

d2_rhs_v_dxdx_7_0_nxp2p0m1jk_nxp2p0m1p1jk = q(nx+2+0-1+1,j,indvars(3))

d2_rhs_v_dxdx_7_0_nxp2p0m1jk = -&
          0.5_wp*d2_rhs_v_dxdx_7_0_nxp2p0m1jk_nxp2p0m1m1jk+&
          0.5_wp*d2_rhs_v_dxdx_7_0_nxp2p0m1jk_nxp2p0m1p1jk

d2_rhs_v_dxdx_7_0_nxp2p0m1jk = d2_rhs_v_dxdx_7_0_nxp2p0m1jk*param_float(1)

d2_rhs_v_dxdx_7_0_nxp2p0m2jk_nxp2p0m2m1jk = q(nx+2+0-2-1,j,indvars(3))

d2_rhs_v_dxdx_7_0_nxp2p0m2jk_nxp2p0m2p1jk = q(nx+2+0-2+1,j,indvars(3))

d2_rhs_v_dxdx_7_0_nxp2p0m2jk = -&
          0.5_wp*d2_rhs_v_dxdx_7_0_nxp2p0m2jk_nxp2p0m2m1jk+&
          0.5_wp*d2_rhs_v_dxdx_7_0_nxp2p0m2jk_nxp2p0m2p1jk

d2_rhs_v_dxdx_7_0_nxp2p0m2jk = d2_rhs_v_dxdx_7_0_nxp2p0m2jk*param_float(1)

d2_rhs_v_dxdy_7_0_nxp2p0p0jk_nxp2p0p0jm1k = q(nx+2+0+0,j-1,indvars(2))

d2_rhs_v_dxdy_7_0_nxp2p0p0jk_nxp2p0p0jp1k = q(nx+2+0+0,j+1,indvars(2))

d2_rhs_v_dxdy_7_0_nxp2p0p0jk = -&
          0.5_wp*d2_rhs_v_dxdy_7_0_nxp2p0p0jk_nxp2p0p0jm1k+&
          0.5_wp*d2_rhs_v_dxdy_7_0_nxp2p0p0jk_nxp2p0p0jp1k

d2_rhs_v_dxdy_7_0_nxp2p0p0jk = d2_rhs_v_dxdy_7_0_nxp2p0p0jk*param_float(2)

d2_rhs_v_dxdy_7_0_nxp2p0m1jk_nxp2p0m1jm1k = q(nx+2+0-1,j-1,indvars(2))

d2_rhs_v_dxdy_7_0_nxp2p0m1jk_nxp2p0m1jp1k = q(nx+2+0-1,j+1,indvars(2))

d2_rhs_v_dxdy_7_0_nxp2p0m1jk = -&
          0.5_wp*d2_rhs_v_dxdy_7_0_nxp2p0m1jk_nxp2p0m1jm1k+&
          0.5_wp*d2_rhs_v_dxdy_7_0_nxp2p0m1jk_nxp2p0m1jp1k

d2_rhs_v_dxdy_7_0_nxp2p0m1jk = d2_rhs_v_dxdy_7_0_nxp2p0m1jk*param_float(2)

d2_rhs_v_dxdy_7_0_nxp2p0m2jk_nxp2p0m2jm1k = q(nx+2+0-2,j-1,indvars(2))

d2_rhs_v_dxdy_7_0_nxp2p0m2jk_nxp2p0m2jp1k = q(nx+2+0-2,j+1,indvars(2))

d2_rhs_v_dxdy_7_0_nxp2p0m2jk = -&
          0.5_wp*d2_rhs_v_dxdy_7_0_nxp2p0m2jk_nxp2p0m2jm1k+&
          0.5_wp*d2_rhs_v_dxdy_7_0_nxp2p0m2jk_nxp2p0m2jp1k

d2_rhs_v_dxdy_7_0_nxp2p0m2jk = d2_rhs_v_dxdy_7_0_nxp2p0m2jk*param_float(2)

d1_rhs_v_dx_7_nxp2p0p0jk = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0+0,j,indvarsst(11))*(d2_rhs_v_dxdy_7_0_nxp2p0p0jk)+&
                    qst(nx+2+0+0,j,indvarsst(10))*(d2_rhs_v_dxdx_7_0_nxp2p0p0jk))

d1_rhs_v_dx_7_nxp2p0m1jk = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0-1,j,indvarsst(11))*(d2_rhs_v_dxdy_7_0_nxp2p0m1jk)+&
                    qst(nx+2+0-1,j,indvarsst(10))*(d2_rhs_v_dxdx_7_0_nxp2p0m1jk))

d1_rhs_v_dx_7_nxp2p0m2jk = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0-2,j,indvarsst(11))*(d2_rhs_v_dxdy_7_0_nxp2p0m2jk)+&
                    qst(nx+2+0-2,j,indvarsst(10))*(d2_rhs_v_dxdx_7_0_nxp2p0m2jk))

d1_rhs_v_dx_7_nxp2p0jk = 1.5_wp*d1_rhs_v_dx_7_nxp2p0p0jk-&
          2.0_wp*d1_rhs_v_dx_7_nxp2p0m1jk+&
          0.5_wp*d1_rhs_v_dx_7_nxp2p0m2jk

d1_rhs_v_dx_7_nxp2p0jk = d1_rhs_v_dx_7_nxp2p0jk*param_float(1)

d1_rhs_v_dy_0_nxp2p0jm1k = q(nx+2+0,j-1,indvars(1))*q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3))

d1_rhs_v_dy_0_nxp2p0jp1k = q(nx+2+0,j+1,indvars(1))*q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3))

d1_rhs_v_dy_0_nxp2p0jk = -&
          0.5_wp*d1_rhs_v_dy_0_nxp2p0jm1k+&
          0.5_wp*d1_rhs_v_dy_0_nxp2p0jp1k

d1_rhs_v_dy_0_nxp2p0jk = d1_rhs_v_dy_0_nxp2p0jk*param_float(2)

d2_rhs_v_dydx_1_0_nxp2p0jm1k_nxp2p0p0jm1k = q(nx+2+0+0,j-1,indvars(2))

d2_rhs_v_dydx_1_0_nxp2p0jm1k_nxp2p0m1jm1k = q(nx+2+0-1,j-1,indvars(2))

d2_rhs_v_dydx_1_0_nxp2p0jm1k_nxp2p0m2jm1k = q(nx+2+0-2,j-1,indvars(2))

d2_rhs_v_dydx_1_0_nxp2p0jm1k = 1.5_wp*d2_rhs_v_dydx_1_0_nxp2p0jm1k_nxp2p0p0jm1k-&
          2.0_wp*d2_rhs_v_dydx_1_0_nxp2p0jm1k_nxp2p0m1jm1k+&
          0.5_wp*d2_rhs_v_dydx_1_0_nxp2p0jm1k_nxp2p0m2jm1k

d2_rhs_v_dydx_1_0_nxp2p0jm1k = d2_rhs_v_dydx_1_0_nxp2p0jm1k*param_float(1)

d2_rhs_v_dydx_1_0_nxp2p0jp1k_nxp2p0p0jp1k = q(nx+2+0+0,j+1,indvars(2))

d2_rhs_v_dydx_1_0_nxp2p0jp1k_nxp2p0m1jp1k = q(nx+2+0-1,j+1,indvars(2))

d2_rhs_v_dydx_1_0_nxp2p0jp1k_nxp2p0m2jp1k = q(nx+2+0-2,j+1,indvars(2))

d2_rhs_v_dydx_1_0_nxp2p0jp1k = 1.5_wp*d2_rhs_v_dydx_1_0_nxp2p0jp1k_nxp2p0p0jp1k-&
          2.0_wp*d2_rhs_v_dydx_1_0_nxp2p0jp1k_nxp2p0m1jp1k+&
          0.5_wp*d2_rhs_v_dydx_1_0_nxp2p0jp1k_nxp2p0m2jp1k

d2_rhs_v_dydx_1_0_nxp2p0jp1k = d2_rhs_v_dydx_1_0_nxp2p0jp1k*param_float(1)

d2_rhs_v_dydy_1_0_nxp2p0jm1k_nxp2p0jm1m1k = q(nx+2+0,j-1-1,indvars(3))

d2_rhs_v_dydy_1_0_nxp2p0jm1k_nxp2p0jm1p1k = q(nx+2+0,j-1+1,indvars(3))

d2_rhs_v_dydy_1_0_nxp2p0jm1k = -&
          0.5_wp*d2_rhs_v_dydy_1_0_nxp2p0jm1k_nxp2p0jm1m1k+&
          0.5_wp*d2_rhs_v_dydy_1_0_nxp2p0jm1k_nxp2p0jm1p1k

d2_rhs_v_dydy_1_0_nxp2p0jm1k = d2_rhs_v_dydy_1_0_nxp2p0jm1k*param_float(2)

d2_rhs_v_dydy_1_0_nxp2p0jp1k_nxp2p0jp1m1k = q(nx+2+0,j+1-1,indvars(3))

d2_rhs_v_dydy_1_0_nxp2p0jp1k_nxp2p0jp1p1k = q(nx+2+0,j+1+1,indvars(3))

d2_rhs_v_dydy_1_0_nxp2p0jp1k = -&
          0.5_wp*d2_rhs_v_dydy_1_0_nxp2p0jp1k_nxp2p0jp1m1k+&
          0.5_wp*d2_rhs_v_dydy_1_0_nxp2p0jp1k_nxp2p0jp1p1k

d2_rhs_v_dydy_1_0_nxp2p0jp1k = d2_rhs_v_dydy_1_0_nxp2p0jp1k*param_float(2)

d1_rhs_v_dy_1_nxp2p0jm1k = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0,j-1,indvarsst(11))*(d2_rhs_v_dydy_1_0_nxp2p0jm1k)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0,j-1,indvarsst(10))*(d2_rhs_v_dydx_1_0_nxp2p0jm1k)+&
                    qst(nx+2+0,j-1,indvarsst(11))*(d2_rhs_v_dydy_1_0_nxp2p0jm1k)))

d1_rhs_v_dy_1_nxp2p0jp1k = -((1+&
                    param_float(21 + 5))/(((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0,j+1,indvarsst(11))*(d2_rhs_v_dydy_1_0_nxp2p0jp1k)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0,j+1,indvarsst(10))*(d2_rhs_v_dydx_1_0_nxp2p0jp1k)+&
                    qst(nx+2+0,j+1,indvarsst(11))*(d2_rhs_v_dydy_1_0_nxp2p0jp1k)))

d1_rhs_v_dy_1_nxp2p0jk = -&
          0.5_wp*d1_rhs_v_dy_1_nxp2p0jm1k+&
          0.5_wp*d1_rhs_v_dy_1_nxp2p0jp1k

d1_rhs_v_dy_1_nxp2p0jk = d1_rhs_v_dy_1_nxp2p0jk*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 None None d(rho v)/dt ********
!                                                           
!***********************************************************


rhs(nx+2+0,j,indvars(3)) =   -  ( q(nx+2+0,j,indvars(3))*(1.0_wp/(param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))**2*((q(nx+2+0,j,indvars(2))*(-&
                    (param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))**2*d1_rhs_rho_dx_1_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    0.5_wp*((((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    -&
                    (((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10)))))+&
                    q(nx+2+0,j,indvars(1))*((1.0_wp*q(nx+2+0,j,indvars(2))*d1_rhs_v_dx_6_nxp2p0jk)*qst(nx+2+0,j,indvarsst(10)))+&
                    d1_rhs_v_dy_0_nxp2p0jk+&
                    qst(nx+2+0,j,indvarsst(10))*(d1_rhs_v_dx_7_nxp2p0jk)+&
                    qst(nx+2+0,j,indvarsst(11))*(d1_rhs_v_dy_1_nxp2p0jk) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 None None d(rho et)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! 0.5_wp*(u**2+v**2)*(1.0_wp/c**2*((u*(-c**2*[rho]_1x+1.0_wp*[p]_1x))*deltaxI+0.5_wp*(((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI+-((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI)))+1.0_wp/gamma_m1*(0.5_wp*(((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI+-((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI))+rho*u*(1.0_wp/(2*rho*c)*(((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI--((c+u)*(c*rho*[u]_1x+1.0_wp*[p]_1x))*deltaxI))+rho*v*((1.0_wp*u*[v]_1x)*deltaxI)+[(rho*et+p)*v]_1y+deltaxI*([-kappa*deltaxI*({T}_1x)-u*(visc_t*(2.0_wp*deltaxI*({u}_1x)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y))))-v*(visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x)))]_1x)+deltayI*([-kappa*deltayI*({T}_1y)-u*(visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x)))-v*(visc_t*(2.0_wp*deltayI*({v}_1y)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y))))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_rhs_et_dxdx_15_0_nxp2p0p0jk_nxp2p0p0p0jk = ((q(nx+2+0+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0+0,j,indvars(2))*q(nx+2+0+0+0,j,indvars(2))+&
                    q(nx+2+0+0+0,j,indvars(3))*q(nx+2+0+0+0,j,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_15_0_nxp2p0p0jk_nxp2p0p0m1jk = ((q(nx+2+0+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0-1,j,indvars(2))*q(nx+2+0+0-1,j,indvars(2))+&
                    q(nx+2+0+0-1,j,indvars(3))*q(nx+2+0+0-1,j,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_15_0_nxp2p0p0jk_nxp2p0p0m2jk = ((q(nx+2+0+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0-2,j,indvars(2))*q(nx+2+0+0-2,j,indvars(2))+&
                    q(nx+2+0+0-2,j,indvars(3))*q(nx+2+0+0-2,j,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_15_0_nxp2p0p0jk = 1.5_wp*d2_rhs_et_dxdx_15_0_nxp2p0p0jk_nxp2p0p0p0jk-&
          2.0_wp*d2_rhs_et_dxdx_15_0_nxp2p0p0jk_nxp2p0p0m1jk+&
          0.5_wp*d2_rhs_et_dxdx_15_0_nxp2p0p0jk_nxp2p0p0m2jk

d2_rhs_et_dxdx_15_0_nxp2p0p0jk = d2_rhs_et_dxdx_15_0_nxp2p0p0jk*param_float(1)

d2_rhs_et_dxdx_15_0_nxp2p0m1jk_nxp2p0m1m1jk = ((q(nx+2+0-1-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1-1,j,indvars(2))*q(nx+2+0-1-1,j,indvars(2))+&
                    q(nx+2+0-1-1,j,indvars(3))*q(nx+2+0-1-1,j,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_15_0_nxp2p0m1jk_nxp2p0m1p1jk = ((q(nx+2+0-1+1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1+1,j,indvars(2))*q(nx+2+0-1+1,j,indvars(2))+&
                    q(nx+2+0-1+1,j,indvars(3))*q(nx+2+0-1+1,j,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_15_0_nxp2p0m1jk = -&
          0.5_wp*d2_rhs_et_dxdx_15_0_nxp2p0m1jk_nxp2p0m1m1jk+&
          0.5_wp*d2_rhs_et_dxdx_15_0_nxp2p0m1jk_nxp2p0m1p1jk

d2_rhs_et_dxdx_15_0_nxp2p0m1jk = d2_rhs_et_dxdx_15_0_nxp2p0m1jk*param_float(1)

d2_rhs_et_dxdx_15_0_nxp2p0m2jk_nxp2p0m2m1jk = ((q(nx+2+0-2-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2-1,j,indvars(2))*q(nx+2+0-2-1,j,indvars(2))+&
                    q(nx+2+0-2-1,j,indvars(3))*q(nx+2+0-2-1,j,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_15_0_nxp2p0m2jk_nxp2p0m2p1jk = ((q(nx+2+0-2+1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2+1,j,indvars(2))*q(nx+2+0-2+1,j,indvars(2))+&
                    q(nx+2+0-2+1,j,indvars(3))*q(nx+2+0-2+1,j,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_15_0_nxp2p0m2jk = -&
          0.5_wp*d2_rhs_et_dxdx_15_0_nxp2p0m2jk_nxp2p0m2m1jk+&
          0.5_wp*d2_rhs_et_dxdx_15_0_nxp2p0m2jk_nxp2p0m2p1jk

d2_rhs_et_dxdx_15_0_nxp2p0m2jk = d2_rhs_et_dxdx_15_0_nxp2p0m2jk*param_float(1)

d1_rhs_et_dx_15_nxp2p0p0jk = -param_float(2 + 5)*qst(nx+2+0+0,j,indvarsst(10))*(d2_rhs_et_dxdx_15_0_nxp2p0p0jk)-&
                    q(nx+2+0+0,j,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0+0,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0p0jk)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0+0,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0p0jk)+&
                    qst(nx+2+0+0,j,indvarsst(11))*(d2_rhs_u_dxdy_10_0_nxp2p0p0jk))))-&
                    q(nx+2+0+0,j,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0+0,j,indvars(2))*q(nx+2+0+0,j,indvars(2))+&
                    q(nx+2+0+0,j,indvars(3))*q(nx+2+0+0,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0+0,j,indvarsst(11))*(d2_rhs_v_dxdy_7_0_nxp2p0p0jk)+&
                    qst(nx+2+0+0,j,indvarsst(10))*(d2_rhs_v_dxdx_7_0_nxp2p0p0jk)))

d1_rhs_et_dx_15_nxp2p0m1jk = -param_float(2 + 5)*qst(nx+2+0-1,j,indvarsst(10))*(d2_rhs_et_dxdx_15_0_nxp2p0m1jk)-&
                    q(nx+2+0-1,j,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0-1,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0m1jk)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0-1,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0m1jk)+&
                    qst(nx+2+0-1,j,indvarsst(11))*(d2_rhs_u_dxdy_10_0_nxp2p0m1jk))))-&
                    q(nx+2+0-1,j,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0-1,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-1,j,indvars(2))*q(nx+2+0-1,j,indvars(2))+&
                    q(nx+2+0-1,j,indvars(3))*q(nx+2+0-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0-1,j,indvarsst(11))*(d2_rhs_v_dxdy_7_0_nxp2p0m1jk)+&
                    qst(nx+2+0-1,j,indvarsst(10))*(d2_rhs_v_dxdx_7_0_nxp2p0m1jk)))

d1_rhs_et_dx_15_nxp2p0m2jk = -param_float(2 + 5)*qst(nx+2+0-2,j,indvarsst(10))*(d2_rhs_et_dxdx_15_0_nxp2p0m2jk)-&
                    q(nx+2+0-2,j,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0-2,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0m2jk)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0-2,j,indvarsst(10))*(d2_rhs_u_dxdx_10_0_nxp2p0m2jk)+&
                    qst(nx+2+0-2,j,indvarsst(11))*(d2_rhs_u_dxdy_10_0_nxp2p0m2jk))))-&
                    q(nx+2+0-2,j,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0-2,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0-2,j,indvars(2))*q(nx+2+0-2,j,indvars(2))+&
                    q(nx+2+0-2,j,indvars(3))*q(nx+2+0-2,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0-2,j,indvarsst(11))*(d2_rhs_v_dxdy_7_0_nxp2p0m2jk)+&
                    qst(nx+2+0-2,j,indvarsst(10))*(d2_rhs_v_dxdx_7_0_nxp2p0m2jk)))

d1_rhs_et_dx_15_nxp2p0jk = 1.5_wp*d1_rhs_et_dx_15_nxp2p0p0jk-&
          2.0_wp*d1_rhs_et_dx_15_nxp2p0m1jk+&
          0.5_wp*d1_rhs_et_dx_15_nxp2p0m2jk

d1_rhs_et_dx_15_nxp2p0jk = d1_rhs_et_dx_15_nxp2p0jk*param_float(1)

d1_rhs_et_dy_0_nxp2p0jm1k = (q(nx+2+0,j-1,indvars(1))*q(nx+2+0,j-1,indvars(4))+&
                    (param_float(3 + 5))*q(nx+2+0,j-1,indvars(1))*((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3))))))*q(nx+2+0,j-1,indvars(3))

d1_rhs_et_dy_0_nxp2p0jp1k = (q(nx+2+0,j+1,indvars(1))*q(nx+2+0,j+1,indvars(4))+&
                    (param_float(3 + 5))*q(nx+2+0,j+1,indvars(1))*((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3))))))*q(nx+2+0,j+1,indvars(3))

d1_rhs_et_dy_0_nxp2p0jk = -&
          0.5_wp*d1_rhs_et_dy_0_nxp2p0jm1k+&
          0.5_wp*d1_rhs_et_dy_0_nxp2p0jp1k

d1_rhs_et_dy_0_nxp2p0jk = d1_rhs_et_dy_0_nxp2p0jk*param_float(2)

d2_rhs_et_dydy_1_0_nxp2p0jm1k_nxp2p0jm1m1k = ((q(nx+2+0,j-1-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1-1,indvars(2))*q(nx+2+0,j-1-1,indvars(2))+&
                    q(nx+2+0,j-1-1,indvars(3))*q(nx+2+0,j-1-1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_1_0_nxp2p0jm1k_nxp2p0jm1p1k = ((q(nx+2+0,j-1+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1+1,indvars(2))*q(nx+2+0,j-1+1,indvars(2))+&
                    q(nx+2+0,j-1+1,indvars(3))*q(nx+2+0,j-1+1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_1_0_nxp2p0jm1k = -&
          0.5_wp*d2_rhs_et_dydy_1_0_nxp2p0jm1k_nxp2p0jm1m1k+&
          0.5_wp*d2_rhs_et_dydy_1_0_nxp2p0jm1k_nxp2p0jm1p1k

d2_rhs_et_dydy_1_0_nxp2p0jm1k = d2_rhs_et_dydy_1_0_nxp2p0jm1k*param_float(2)

d2_rhs_et_dydy_1_0_nxp2p0jp1k_nxp2p0jp1m1k = ((q(nx+2+0,j+1-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1-1,indvars(2))*q(nx+2+0,j+1-1,indvars(2))+&
                    q(nx+2+0,j+1-1,indvars(3))*q(nx+2+0,j+1-1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_1_0_nxp2p0jp1k_nxp2p0jp1p1k = ((q(nx+2+0,j+1+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1+1,indvars(2))*q(nx+2+0,j+1+1,indvars(2))+&
                    q(nx+2+0,j+1+1,indvars(3))*q(nx+2+0,j+1+1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_1_0_nxp2p0jp1k = -&
          0.5_wp*d2_rhs_et_dydy_1_0_nxp2p0jp1k_nxp2p0jp1m1k+&
          0.5_wp*d2_rhs_et_dydy_1_0_nxp2p0jp1k_nxp2p0jp1p1k

d2_rhs_et_dydy_1_0_nxp2p0jp1k = d2_rhs_et_dydy_1_0_nxp2p0jp1k*param_float(2)

d1_rhs_et_dy_1_nxp2p0jm1k = -param_float(2 + 5)*qst(nx+2+0,j-1,indvarsst(11))*(d2_rhs_et_dydy_1_0_nxp2p0jm1k)-&
                    q(nx+2+0,j-1,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0,j-1,indvarsst(11))*(d2_rhs_u_dydy_1_0_nxp2p0jm1k)+&
                    qst(nx+2+0,j-1,indvarsst(10))*(d2_rhs_u_dydx_1_0_nxp2p0jm1k)))-&
                    q(nx+2+0,j-1,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0,j-1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j-1,indvars(2))*q(nx+2+0,j-1,indvars(2))+&
                    q(nx+2+0,j-1,indvars(3))*q(nx+2+0,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0,j-1,indvarsst(11))*(d2_rhs_v_dydy_1_0_nxp2p0jm1k)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0,j-1,indvarsst(10))*(d2_rhs_v_dydx_1_0_nxp2p0jm1k)+&
                    qst(nx+2+0,j-1,indvarsst(11))*(d2_rhs_v_dydy_1_0_nxp2p0jm1k))))

d1_rhs_et_dy_1_nxp2p0jp1k = -param_float(2 + 5)*qst(nx+2+0,j+1,indvarsst(11))*(d2_rhs_et_dydy_1_0_nxp2p0jp1k)-&
                    q(nx+2+0,j+1,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(nx+2+0,j+1,indvarsst(11))*(d2_rhs_u_dydy_1_0_nxp2p0jp1k)+&
                    qst(nx+2+0,j+1,indvarsst(10))*(d2_rhs_u_dydx_1_0_nxp2p0jp1k)))-&
                    q(nx+2+0,j+1,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(nx+2+0,j+1,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j+1,indvars(2))*q(nx+2+0,j+1,indvars(2))+&
                    q(nx+2+0,j+1,indvars(3))*q(nx+2+0,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(nx+2+0,j+1,indvarsst(11))*(d2_rhs_v_dydy_1_0_nxp2p0jp1k)-&
                    2.0_wp/3.0_wp*(qst(nx+2+0,j+1,indvarsst(10))*(d2_rhs_v_dydx_1_0_nxp2p0jp1k)+&
                    qst(nx+2+0,j+1,indvarsst(11))*(d2_rhs_v_dydy_1_0_nxp2p0jp1k))))

d1_rhs_et_dy_1_nxp2p0jk = -&
          0.5_wp*d1_rhs_et_dy_1_nxp2p0jm1k+&
          0.5_wp*d1_rhs_et_dy_1_nxp2p0jp1k

d1_rhs_et_dy_1_nxp2p0jk = d1_rhs_et_dy_1_nxp2p0jk*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 None None d(rho et)/dt *******
!                                                           
!***********************************************************


rhs(nx+2+0,j,indvars(4)) =   -  ( 0.5_wp*(q(nx+2+0,j,indvars(2))**2+&
                    q(nx+2+0,j,indvars(3))**2)*(1.0_wp/(param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))**2*((q(nx+2+0,j,indvars(2))*(-&
                    (param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))**2*d1_rhs_rho_dx_1_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    0.5_wp*((((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    -&
                    (((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10)))))+&
                    1.0_wp/param_float(3 + 5)*(0.5_wp*((((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))+&
                    -&
                    (((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))))+&
                    q(nx+2+0,j,indvars(1))*q(nx+2+0,j,indvars(2))*(1.0_wp/(2*q(nx+2+0,j,indvars(1))*(param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1))))*((((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))-&
                    -&
                    (((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))+&
                    q(nx+2+0,j,indvars(2)))*((param_float(23 + 5)*(param_float(3 + 5))*q(nx+2+0,j,indvars(1))*((q(nx+2+0,j,indvars(4))-&
                    0.5_wp*(q(nx+2+0,j,indvars(2))*q(nx+2+0,j,indvars(2))+&
                    q(nx+2+0,j,indvars(3))*q(nx+2+0,j,indvars(3)))))/q(nx+2+0,j,indvars(1)))*q(nx+2+0,j,indvars(1))*d1_rhs_rho_dx_3_nxp2p0jk+&
                    1.0_wp*d1_rhs_rho_dx_2_nxp2p0jk))*qst(nx+2+0,j,indvarsst(10))))+&
                    q(nx+2+0,j,indvars(1))*q(nx+2+0,j,indvars(3))*((1.0_wp*q(nx+2+0,j,indvars(2))*d1_rhs_v_dx_6_nxp2p0jk)*qst(nx+2+0,j,indvarsst(10)))+&
                    d1_rhs_et_dy_0_nxp2p0jk+&
                    qst(nx+2+0,j,indvarsst(10))*(d1_rhs_et_dx_15_nxp2p0jk)+&
                    qst(nx+2+0,j,indvarsst(11))*(d1_rhs_et_dy_1_nxp2p0jk) ) 

     enddo
