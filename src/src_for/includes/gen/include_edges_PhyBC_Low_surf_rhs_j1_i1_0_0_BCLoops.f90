

!***********************************************************
!                                                           
! Start building layers for BC : i1 j1 None ****************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: 0 0 None ***************************************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None d(rho)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (deltaxI*([rho*u]_1x))*symm+(rho*([v]_1y)*deltayI)*wall
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_rhs_rho_dx_0_1m2p0p01m2p0k = q(1-2+0+0,1-2+0,indvars(1))*q(1-2+0+0,1-2+0,indvars(2))

d1_rhs_rho_dx_0_1m2p0p11m2p0k = q(1-2+0+1,1-2+0,indvars(1))*q(1-2+0+1,1-2+0,indvars(2))

d1_rhs_rho_dx_0_1m2p0p21m2p0k = q(1-2+0+2,1-2+0,indvars(1))*q(1-2+0+2,1-2+0,indvars(2))

d1_rhs_rho_dx_0_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_rho_dx_0_1m2p0p01m2p0k+&
          2.0_wp*d1_rhs_rho_dx_0_1m2p0p11m2p0k-&
          0.5_wp*d1_rhs_rho_dx_0_1m2p0p21m2p0k

d1_rhs_rho_dx_0_1m2p01m2p0k = d1_rhs_rho_dx_0_1m2p01m2p0k*param_float(1)

d1_rhs_rho_dy_0_1m2p01m2p0p0k = q(1-2+0,1-2+0+0,indvars(3))

d1_rhs_rho_dy_0_1m2p01m2p0p1k = q(1-2+0,1-2+0+1,indvars(3))

d1_rhs_rho_dy_0_1m2p01m2p0p2k = q(1-2+0,1-2+0+2,indvars(3))

d1_rhs_rho_dy_0_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_rho_dy_0_1m2p01m2p0p0k+&
          2.0_wp*d1_rhs_rho_dy_0_1m2p01m2p0p1k-&
          0.5_wp*d1_rhs_rho_dy_0_1m2p01m2p0p2k

d1_rhs_rho_dy_0_1m2p01m2p0k = d1_rhs_rho_dy_0_1m2p01m2p0k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None d(rho)/dt *************
!                                                           
!***********************************************************


rhs(1-2+0,1-2+0,indvars(1)) =   -  ( (qst(1-2+0,1-2+0,indvarsst(10))*(d1_rhs_rho_dx_0_1m2p01m2p0k))*qst(1-2+0,1-2+0,indvarsst(5))+&
                    (q(1-2+0,1-2+0,indvars(1))*(d1_rhs_rho_dy_0_1m2p01m2p0k)*qst(1-2+0,1-2+0,indvarsst(11)))*qst(1-2+0,1-2+0,indvarsst(12)) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None d(rho u)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (deltaxI*([-4.0_wp/3.0_wp*visc_t*({u}_1x)*deltaxI]_1x)+deltaxI*([rho*u*u+p]_1x))*symm
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p01m2p0k = q(1-2+0+0+0,1-2+0,indvars(2))

d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p11m2p0k = q(1-2+0+0+1,1-2+0,indvars(2))

d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p21m2p0k = q(1-2+0+0+2,1-2+0,indvars(2))

d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k = -&
          1.5_wp*d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p01m2p0k+&
          2.0_wp*d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p11m2p0k-&
          0.5_wp*d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p21m2p0k

d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k = d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k*param_float(1)

d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k_1m2p0p1m11m2p0k = q(1-2+0+1-1,1-2+0,indvars(2))

d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k_1m2p0p1p11m2p0k = q(1-2+0+1+1,1-2+0,indvars(2))

d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k = -&
          0.5_wp*d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k_1m2p0p1m11m2p0k+&
          0.5_wp*d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k_1m2p0p1p11m2p0k

d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k = d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k*param_float(1)

d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k_1m2p0p2m11m2p0k = q(1-2+0+2-1,1-2+0,indvars(2))

d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k_1m2p0p2p11m2p0k = q(1-2+0+2+1,1-2+0,indvars(2))

d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k = -&
          0.5_wp*d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k_1m2p0p2m11m2p0k+&
          0.5_wp*d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k_1m2p0p2p11m2p0k

d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k = d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k*param_float(1)

d1_rhs_u_dx_1_1m2p0p01m2p0k = q(1-2+0+0,1-2+0,indvars(1))*q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+(param_float(3 + 5))*q(1-2+0+0,1-2+0,indvars(1))*((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))

d1_rhs_u_dx_1_1m2p0p11m2p0k = q(1-2+0+1,1-2+0,indvars(1))*q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+(param_float(3 + 5))*q(1-2+0+1,1-2+0,indvars(1))*((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))

d1_rhs_u_dx_1_1m2p0p21m2p0k = q(1-2+0+2,1-2+0,indvars(1))*q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+(param_float(3 + 5))*q(1-2+0+2,1-2+0,indvars(1))*((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))

d1_rhs_u_dx_1_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_u_dx_1_1m2p0p01m2p0k+&
          2.0_wp*d1_rhs_u_dx_1_1m2p0p11m2p0k-&
          0.5_wp*d1_rhs_u_dx_1_1m2p0p21m2p0k

d1_rhs_u_dx_1_1m2p01m2p0k = d1_rhs_u_dx_1_1m2p01m2p0k*param_float(1)

d1_rhs_u_dx_0_1m2p0p01m2p0k = -4.0_wp/3.0_wp*((1+&
                    param_float(21 + 5))/(((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k)*qst(1-2+0+0,1-2+0,indvarsst(10))

d1_rhs_u_dx_0_1m2p0p11m2p0k = -4.0_wp/3.0_wp*((1+&
                    param_float(21 + 5))/(((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k)*qst(1-2+0+1,1-2+0,indvarsst(10))

d1_rhs_u_dx_0_1m2p0p21m2p0k = -4.0_wp/3.0_wp*((1+&
                    param_float(21 + 5))/(((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k)*qst(1-2+0+2,1-2+0,indvarsst(10))

d1_rhs_u_dx_0_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_u_dx_0_1m2p0p01m2p0k+&
          2.0_wp*d1_rhs_u_dx_0_1m2p0p11m2p0k-&
          0.5_wp*d1_rhs_u_dx_0_1m2p0p21m2p0k

d1_rhs_u_dx_0_1m2p01m2p0k = d1_rhs_u_dx_0_1m2p01m2p0k*param_float(1)



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None d(rho u)/dt ***********
!                                                           
!***********************************************************


rhs(1-2+0,1-2+0,indvars(2)) =   -  ( (qst(1-2+0,1-2+0,indvarsst(10))*(d1_rhs_u_dx_0_1m2p01m2p0k)+&
                    qst(1-2+0,1-2+0,indvarsst(10))*(d1_rhs_u_dx_1_1m2p01m2p0k))*qst(1-2+0,1-2+0,indvarsst(5)) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None d(rho v)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (deltaxI*([-visc_t*({v}_1x)*deltaxI]_1x)+deltaxI*([rho*u*v]_1x))*symm
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p01m2p0k = q(1-2+0+0+0,1-2+0,indvars(3))

d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p11m2p0k = q(1-2+0+0+1,1-2+0,indvars(3))

d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p21m2p0k = q(1-2+0+0+2,1-2+0,indvars(3))

d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k = -&
          1.5_wp*d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p01m2p0k+&
          2.0_wp*d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p11m2p0k-&
          0.5_wp*d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k_1m2p0p0p21m2p0k

d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k = d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k*param_float(1)

d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k_1m2p0p1m11m2p0k = q(1-2+0+1-1,1-2+0,indvars(3))

d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k_1m2p0p1p11m2p0k = q(1-2+0+1+1,1-2+0,indvars(3))

d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k = -&
          0.5_wp*d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k_1m2p0p1m11m2p0k+&
          0.5_wp*d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k_1m2p0p1p11m2p0k

d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k = d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k*param_float(1)

d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k_1m2p0p2m11m2p0k = q(1-2+0+2-1,1-2+0,indvars(3))

d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k_1m2p0p2p11m2p0k = q(1-2+0+2+1,1-2+0,indvars(3))

d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k = -&
          0.5_wp*d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k_1m2p0p2m11m2p0k+&
          0.5_wp*d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k_1m2p0p2p11m2p0k

d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k = d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k*param_float(1)

d1_rhs_v_dx_1_1m2p0p01m2p0k = q(1-2+0+0,1-2+0,indvars(1))*q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(3))

d1_rhs_v_dx_1_1m2p0p11m2p0k = q(1-2+0+1,1-2+0,indvars(1))*q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(3))

d1_rhs_v_dx_1_1m2p0p21m2p0k = q(1-2+0+2,1-2+0,indvars(1))*q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(3))

d1_rhs_v_dx_1_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_v_dx_1_1m2p0p01m2p0k+&
          2.0_wp*d1_rhs_v_dx_1_1m2p0p11m2p0k-&
          0.5_wp*d1_rhs_v_dx_1_1m2p0p21m2p0k

d1_rhs_v_dx_1_1m2p01m2p0k = d1_rhs_v_dx_1_1m2p01m2p0k*param_float(1)

d1_rhs_v_dx_0_1m2p0p01m2p0k = -((1+&
                    param_float(21 + 5))/(((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k)*qst(1-2+0+0,1-2+0,indvarsst(10))

d1_rhs_v_dx_0_1m2p0p11m2p0k = -((1+&
                    param_float(21 + 5))/(((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k)*qst(1-2+0+1,1-2+0,indvarsst(10))

d1_rhs_v_dx_0_1m2p0p21m2p0k = -((1+&
                    param_float(21 + 5))/(((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k)*qst(1-2+0+2,1-2+0,indvarsst(10))

d1_rhs_v_dx_0_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_v_dx_0_1m2p0p01m2p0k+&
          2.0_wp*d1_rhs_v_dx_0_1m2p0p11m2p0k-&
          0.5_wp*d1_rhs_v_dx_0_1m2p0p21m2p0k

d1_rhs_v_dx_0_1m2p01m2p0k = d1_rhs_v_dx_0_1m2p01m2p0k*param_float(1)



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None d(rho v)/dt ***********
!                                                           
!***********************************************************


rhs(1-2+0,1-2+0,indvars(3)) =   -  ( (qst(1-2+0,1-2+0,indvarsst(10))*(d1_rhs_v_dx_0_1m2p01m2p0k)+&
                    qst(1-2+0,1-2+0,indvarsst(10))*(d1_rhs_v_dx_1_1m2p01m2p0k))*qst(1-2+0,1-2+0,indvarsst(5)) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None d(rho et)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (deltaxI*([-4.0_wp/3.0_wp*visc_t*({u}_1x)*deltaxI*u-visc_t*({v}_1x)*deltaxI*v-kappa*({T}_1x)*deltaxI]_1x)+deltaxI*([(rho*et+p)*u]_1x))*symm+(-visc_t*([u]_1y)*([u]_1y)*deltayI**2-4.0_wp/3.0_wp*visc_t*([v]_1y)*([v]_1y)*deltayI**2-kappa*([({T}_1y)*deltayI]_1y)-kappa*([({T}_1x)*deltaxI]_1x)+(rho*et+p)*([v]_1y)*deltayI)*wall
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k_1m2p0p0p01m2p0k = ((q(1-2+0+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0+0,1-2+0,indvars(2))*q(1-2+0+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0+0,1-2+0,indvars(3))*q(1-2+0+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k_1m2p0p0p11m2p0k = ((q(1-2+0+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0+1,1-2+0,indvars(2))*q(1-2+0+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+0+1,1-2+0,indvars(3))*q(1-2+0+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k_1m2p0p0p21m2p0k = ((q(1-2+0+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0+2,1-2+0,indvars(2))*q(1-2+0+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+0+2,1-2+0,indvars(3))*q(1-2+0+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k = -&
          1.5_wp*d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k_1m2p0p0p01m2p0k+&
          2.0_wp*d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k_1m2p0p0p11m2p0k-&
          0.5_wp*d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k_1m2p0p0p21m2p0k

d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k = d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k*param_float(1)

d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k_1m2p0p1m11m2p0k = ((q(1-2+0+1-1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1-1,1-2+0,indvars(2))*q(1-2+0+1-1,1-2+0,indvars(2))+&
                    q(1-2+0+1-1,1-2+0,indvars(3))*q(1-2+0+1-1,1-2+0,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k_1m2p0p1p11m2p0k = ((q(1-2+0+1+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1+1,1-2+0,indvars(2))*q(1-2+0+1+1,1-2+0,indvars(2))+&
                    q(1-2+0+1+1,1-2+0,indvars(3))*q(1-2+0+1+1,1-2+0,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k = -&
          0.5_wp*d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k_1m2p0p1m11m2p0k+&
          0.5_wp*d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k_1m2p0p1p11m2p0k

d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k = d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k*param_float(1)

d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k_1m2p0p2m11m2p0k = ((q(1-2+0+2-1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2-1,1-2+0,indvars(2))*q(1-2+0+2-1,1-2+0,indvars(2))+&
                    q(1-2+0+2-1,1-2+0,indvars(3))*q(1-2+0+2-1,1-2+0,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k_1m2p0p2p11m2p0k = ((q(1-2+0+2+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2+1,1-2+0,indvars(2))*q(1-2+0+2+1,1-2+0,indvars(2))+&
                    q(1-2+0+2+1,1-2+0,indvars(3))*q(1-2+0+2+1,1-2+0,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k = -&
          0.5_wp*d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k_1m2p0p2m11m2p0k+&
          0.5_wp*d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k_1m2p0p2p11m2p0k

d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k = d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k*param_float(1)

d1_rhs_et_dx_1_1m2p0p01m2p0k = (q(1-2+0+0,1-2+0,indvars(1))*q(1-2+0+0,1-2+0,indvars(4))+&
                    (param_float(3 + 5))*q(1-2+0+0,1-2+0,indvars(1))*((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3))))))*q(1-2+0+0,1-2+0,indvars(2))

d1_rhs_et_dx_1_1m2p0p11m2p0k = (q(1-2+0+1,1-2+0,indvars(1))*q(1-2+0+1,1-2+0,indvars(4))+&
                    (param_float(3 + 5))*q(1-2+0+1,1-2+0,indvars(1))*((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3))))))*q(1-2+0+1,1-2+0,indvars(2))

d1_rhs_et_dx_1_1m2p0p21m2p0k = (q(1-2+0+2,1-2+0,indvars(1))*q(1-2+0+2,1-2+0,indvars(4))+&
                    (param_float(3 + 5))*q(1-2+0+2,1-2+0,indvars(1))*((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3))))))*q(1-2+0+2,1-2+0,indvars(2))

d1_rhs_et_dx_1_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_et_dx_1_1m2p0p01m2p0k+&
          2.0_wp*d1_rhs_et_dx_1_1m2p0p11m2p0k-&
          0.5_wp*d1_rhs_et_dx_1_1m2p0p21m2p0k

d1_rhs_et_dx_1_1m2p01m2p0k = d1_rhs_et_dx_1_1m2p01m2p0k*param_float(1)

d1_rhs_et_dx_0_1m2p0p01m2p0k = -4.0_wp/3.0_wp*((1+&
                    param_float(21 + 5))/(((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_u_dxdx_0_0_1m2p0p01m2p0k)*qst(1-2+0+0,1-2+0,indvarsst(10))*q(1-2+0+0,1-2+0,indvars(2))-&
                    ((1+&
                    param_float(21 + 5))/(((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+0,1-2+0,indvars(2))*q(1-2+0+0,1-2+0,indvars(2))+&
                    q(1-2+0+0,1-2+0,indvars(3))*q(1-2+0+0,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_v_dxdx_0_0_1m2p0p01m2p0k)*qst(1-2+0+0,1-2+0,indvarsst(10))*q(1-2+0+0,1-2+0,indvars(3))-&
                    param_float(2 + 5)*(d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k)*qst(1-2+0+0,1-2+0,indvarsst(10))

d1_rhs_et_dx_0_1m2p0p11m2p0k = -4.0_wp/3.0_wp*((1+&
                    param_float(21 + 5))/(((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_u_dxdx_0_0_1m2p0p11m2p0k)*qst(1-2+0+1,1-2+0,indvarsst(10))*q(1-2+0+1,1-2+0,indvars(2))-&
                    ((1+&
                    param_float(21 + 5))/(((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+1,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+1,1-2+0,indvars(2))*q(1-2+0+1,1-2+0,indvars(2))+&
                    q(1-2+0+1,1-2+0,indvars(3))*q(1-2+0+1,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_v_dxdx_0_0_1m2p0p11m2p0k)*qst(1-2+0+1,1-2+0,indvarsst(10))*q(1-2+0+1,1-2+0,indvars(3))-&
                    param_float(2 + 5)*(d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k)*qst(1-2+0+1,1-2+0,indvarsst(10))

d1_rhs_et_dx_0_1m2p0p21m2p0k = -4.0_wp/3.0_wp*((1+&
                    param_float(21 + 5))/(((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_u_dxdx_0_0_1m2p0p21m2p0k)*qst(1-2+0+2,1-2+0,indvarsst(10))*q(1-2+0+2,1-2+0,indvars(2))-&
                    ((1+&
                    param_float(21 + 5))/(((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0+2,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0+2,1-2+0,indvars(2))*q(1-2+0+2,1-2+0,indvars(2))+&
                    q(1-2+0+2,1-2+0,indvars(3))*q(1-2+0+2,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d2_rhs_v_dxdx_0_0_1m2p0p21m2p0k)*qst(1-2+0+2,1-2+0,indvarsst(10))*q(1-2+0+2,1-2+0,indvars(3))-&
                    param_float(2 + 5)*(d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k)*qst(1-2+0+2,1-2+0,indvarsst(10))

d1_rhs_et_dx_0_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_et_dx_0_1m2p0p01m2p0k+&
          2.0_wp*d1_rhs_et_dx_0_1m2p0p11m2p0k-&
          0.5_wp*d1_rhs_et_dx_0_1m2p0p21m2p0k

d1_rhs_et_dx_0_1m2p01m2p0k = d1_rhs_et_dx_0_1m2p01m2p0k*param_float(1)

d1_rhs_et_dx_2_1m2p0p01m2p0k = (d2_rhs_et_dxdx_0_2_1m2p0p01m2p0k)*qst(1-2+0+0,1-2+0,indvarsst(10))

d1_rhs_et_dx_2_1m2p0p11m2p0k = (d2_rhs_et_dxdx_0_2_1m2p0p11m2p0k)*qst(1-2+0+1,1-2+0,indvarsst(10))

d1_rhs_et_dx_2_1m2p0p21m2p0k = (d2_rhs_et_dxdx_0_2_1m2p0p21m2p0k)*qst(1-2+0+2,1-2+0,indvarsst(10))

d1_rhs_et_dx_2_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_et_dx_2_1m2p0p01m2p0k+&
          2.0_wp*d1_rhs_et_dx_2_1m2p0p11m2p0k-&
          0.5_wp*d1_rhs_et_dx_2_1m2p0p21m2p0k

d1_rhs_et_dx_2_1m2p01m2p0k = d1_rhs_et_dx_2_1m2p01m2p0k*param_float(1)

d1_rhs_et_dy_0_1m2p01m2p0p0k = q(1-2+0,1-2+0+0,indvars(2))

d1_rhs_et_dy_0_1m2p01m2p0p1k = q(1-2+0,1-2+0+1,indvars(2))

d1_rhs_et_dy_0_1m2p01m2p0p2k = q(1-2+0,1-2+0+2,indvars(2))

d1_rhs_et_dy_0_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_et_dy_0_1m2p01m2p0p0k+&
          2.0_wp*d1_rhs_et_dy_0_1m2p01m2p0p1k-&
          0.5_wp*d1_rhs_et_dy_0_1m2p01m2p0p2k

d1_rhs_et_dy_0_1m2p01m2p0k = d1_rhs_et_dy_0_1m2p01m2p0k*param_float(2)

d2_rhs_et_dydy_4_0_1m2p01m2p0p0k_1m2p01m2p0p0p0k = ((q(1-2+0,1-2+0+0+0,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0+0+0,indvars(2))*q(1-2+0,1-2+0+0+0,indvars(2))+&
                    q(1-2+0,1-2+0+0+0,indvars(3))*q(1-2+0,1-2+0+0+0,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_4_0_1m2p01m2p0p0k_1m2p01m2p0p0p1k = ((q(1-2+0,1-2+0+0+1,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0+0+1,indvars(2))*q(1-2+0,1-2+0+0+1,indvars(2))+&
                    q(1-2+0,1-2+0+0+1,indvars(3))*q(1-2+0,1-2+0+0+1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_4_0_1m2p01m2p0p0k_1m2p01m2p0p0p2k = ((q(1-2+0,1-2+0+0+2,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0+0+2,indvars(2))*q(1-2+0,1-2+0+0+2,indvars(2))+&
                    q(1-2+0,1-2+0+0+2,indvars(3))*q(1-2+0,1-2+0+0+2,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_4_0_1m2p01m2p0p0k = -&
          1.5_wp*d2_rhs_et_dydy_4_0_1m2p01m2p0p0k_1m2p01m2p0p0p0k+&
          2.0_wp*d2_rhs_et_dydy_4_0_1m2p01m2p0p0k_1m2p01m2p0p0p1k-&
          0.5_wp*d2_rhs_et_dydy_4_0_1m2p01m2p0p0k_1m2p01m2p0p0p2k

d2_rhs_et_dydy_4_0_1m2p01m2p0p0k = d2_rhs_et_dydy_4_0_1m2p01m2p0p0k*param_float(2)

d2_rhs_et_dydy_4_0_1m2p01m2p0p1k_1m2p01m2p0p1m1k = ((q(1-2+0,1-2+0+1-1,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0+1-1,indvars(2))*q(1-2+0,1-2+0+1-1,indvars(2))+&
                    q(1-2+0,1-2+0+1-1,indvars(3))*q(1-2+0,1-2+0+1-1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_4_0_1m2p01m2p0p1k_1m2p01m2p0p1p1k = ((q(1-2+0,1-2+0+1+1,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0+1+1,indvars(2))*q(1-2+0,1-2+0+1+1,indvars(2))+&
                    q(1-2+0,1-2+0+1+1,indvars(3))*q(1-2+0,1-2+0+1+1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_4_0_1m2p01m2p0p1k = -&
          0.5_wp*d2_rhs_et_dydy_4_0_1m2p01m2p0p1k_1m2p01m2p0p1m1k+&
          0.5_wp*d2_rhs_et_dydy_4_0_1m2p01m2p0p1k_1m2p01m2p0p1p1k

d2_rhs_et_dydy_4_0_1m2p01m2p0p1k = d2_rhs_et_dydy_4_0_1m2p01m2p0p1k*param_float(2)

d2_rhs_et_dydy_4_0_1m2p01m2p0p2k_1m2p01m2p0p2m1k = ((q(1-2+0,1-2+0+2-1,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0+2-1,indvars(2))*q(1-2+0,1-2+0+2-1,indvars(2))+&
                    q(1-2+0,1-2+0+2-1,indvars(3))*q(1-2+0,1-2+0+2-1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_4_0_1m2p01m2p0p2k_1m2p01m2p0p2p1k = ((q(1-2+0,1-2+0+2+1,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0+2+1,indvars(2))*q(1-2+0,1-2+0+2+1,indvars(2))+&
                    q(1-2+0,1-2+0+2+1,indvars(3))*q(1-2+0,1-2+0+2+1,indvars(3)))))/param_float(4 + 5)

d2_rhs_et_dydy_4_0_1m2p01m2p0p2k = -&
          0.5_wp*d2_rhs_et_dydy_4_0_1m2p01m2p0p2k_1m2p01m2p0p2m1k+&
          0.5_wp*d2_rhs_et_dydy_4_0_1m2p01m2p0p2k_1m2p01m2p0p2p1k

d2_rhs_et_dydy_4_0_1m2p01m2p0p2k = d2_rhs_et_dydy_4_0_1m2p01m2p0p2k*param_float(2)

d1_rhs_et_dy_4_1m2p01m2p0p0k = (d2_rhs_et_dydy_4_0_1m2p01m2p0p0k)*qst(1-2+0,1-2+0+0,indvarsst(11))

d1_rhs_et_dy_4_1m2p01m2p0p1k = (d2_rhs_et_dydy_4_0_1m2p01m2p0p1k)*qst(1-2+0,1-2+0+1,indvarsst(11))

d1_rhs_et_dy_4_1m2p01m2p0p2k = (d2_rhs_et_dydy_4_0_1m2p01m2p0p2k)*qst(1-2+0,1-2+0+2,indvarsst(11))

d1_rhs_et_dy_4_1m2p01m2p0k = -&
          1.5_wp*d1_rhs_et_dy_4_1m2p01m2p0p0k+&
          2.0_wp*d1_rhs_et_dy_4_1m2p01m2p0p1k-&
          0.5_wp*d1_rhs_et_dy_4_1m2p01m2p0p2k

d1_rhs_et_dy_4_1m2p01m2p0k = d1_rhs_et_dy_4_1m2p01m2p0k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None d(rho et)/dt **********
!                                                           
!***********************************************************


rhs(1-2+0,1-2+0,indvars(4)) =   -  ( (qst(1-2+0,1-2+0,indvarsst(10))*(d1_rhs_et_dx_0_1m2p01m2p0k)+&
                    qst(1-2+0,1-2+0,indvarsst(10))*(d1_rhs_et_dx_1_1m2p01m2p0k))*qst(1-2+0,1-2+0,indvarsst(5))+&
                    (-&
                    ((1+&
                    param_float(21 + 5))/(((q(1-2+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0,indvars(2))*q(1-2+0,1-2+0,indvars(2))+&
                    q(1-2+0,1-2+0,indvars(3))*q(1-2+0,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0,indvars(2))*q(1-2+0,1-2+0,indvars(2))+&
                    q(1-2+0,1-2+0,indvars(3))*q(1-2+0,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d1_rhs_et_dy_0_1m2p01m2p0k)*(d1_rhs_et_dy_0_1m2p01m2p0k)*qst(1-2+0,1-2+0,indvarsst(11))**2-&
                    4.0_wp/3.0_wp*((1+&
                    param_float(21 + 5))/(((q(1-2+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0,indvars(2))*q(1-2+0,1-2+0,indvars(2))+&
                    q(1-2+0,1-2+0,indvars(3))*q(1-2+0,1-2+0,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(1-2+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0,indvars(2))*q(1-2+0,1-2+0,indvars(2))+&
                    q(1-2+0,1-2+0,indvars(3))*q(1-2+0,1-2+0,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(d1_rhs_rho_dy_0_1m2p01m2p0k)*(d1_rhs_rho_dy_0_1m2p01m2p0k)*qst(1-2+0,1-2+0,indvarsst(11))**2-&
                    param_float(2 + 5)*(d1_rhs_et_dy_4_1m2p01m2p0k)-&
                    param_float(2 + 5)*(d1_rhs_et_dx_2_1m2p01m2p0k)+&
                    (q(1-2+0,1-2+0,indvars(1))*q(1-2+0,1-2+0,indvars(4))+&
                    (param_float(3 + 5))*q(1-2+0,1-2+0,indvars(1))*((q(1-2+0,1-2+0,indvars(4))-&
                    0.5_wp*(q(1-2+0,1-2+0,indvars(2))*q(1-2+0,1-2+0,indvars(2))+&
                    q(1-2+0,1-2+0,indvars(3))*q(1-2+0,1-2+0,indvars(3))))))*(d1_rhs_rho_dy_0_1m2p01m2p0k)*qst(1-2+0,1-2+0,indvarsst(11)))*qst(1-2+0,1-2+0,indvarsst(12)) ) 

