

!***********************************************************
!                                                           
! Start building RHS with source terms (2D) ****************
!                                                           
!***********************************************************


     do j=idloop(3),idloop(4) 
 
      do i=idloop(1),idloop(2) 


!***********************************************************
!                                                           
! building source terms in RHS for d(rho)/dt ***************
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([rho*u]_1x)+deltayI*([rho*v]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_conv_rho_dx_0_im2jk = q(i-2,j,indvars(1))*q(i-2,j,indvars(2))

d1_conv_rho_dx_0_im1jk = q(i-1,j,indvars(1))*q(i-1,j,indvars(2))

d1_conv_rho_dx_0_ip1jk = q(i+1,j,indvars(1))*q(i+1,j,indvars(2))

d1_conv_rho_dx_0_ip2jk = q(i+2,j,indvars(1))*q(i+2,j,indvars(2))

d1_conv_rho_dx_0_ijk = 0.08333333333333333_wp*d1_conv_rho_dx_0_im2jk-&
          0.666666666666667_wp*d1_conv_rho_dx_0_im1jk+&
          0.666666666666667_wp*d1_conv_rho_dx_0_ip1jk-&
          0.08333333333333333_wp*d1_conv_rho_dx_0_ip2jk

d1_conv_rho_dx_0_ijk = d1_conv_rho_dx_0_ijk*param_float(1)

d1_conv_rho_dy_0_ijm2k = q(i,j-2,indvars(1))*q(i,j-2,indvars(3))

d1_conv_rho_dy_0_ijm1k = q(i,j-1,indvars(1))*q(i,j-1,indvars(3))

d1_conv_rho_dy_0_ijp1k = q(i,j+1,indvars(1))*q(i,j+1,indvars(3))

d1_conv_rho_dy_0_ijp2k = q(i,j+2,indvars(1))*q(i,j+2,indvars(3))

d1_conv_rho_dy_0_ijk = 0.08333333333333333_wp*d1_conv_rho_dy_0_ijm2k-&
          0.666666666666667_wp*d1_conv_rho_dy_0_ijm1k+&
          0.666666666666667_wp*d1_conv_rho_dy_0_ijp1k-&
          0.08333333333333333_wp*d1_conv_rho_dy_0_ijp2k

d1_conv_rho_dy_0_ijk = d1_conv_rho_dy_0_ijk*param_float(2)



!***********************************************************
!                                                           
! Update RHS terms for d(rho)/dt ***************************
!                                                           
!***********************************************************


rhs(i,j,indvars(1)) =   -  ( qst(i,j,indvarsst(10))*(d1_conv_rho_dx_0_ijk)+&
                    qst(i,j,indvarsst(11))*(d1_conv_rho_dy_0_ijk) ) 



!***********************************************************
!                                                           
! building source terms in RHS for d(rho u)/dt *************
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([rho*u*u+p]_1x)+deltayI*([rho*v*u]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_conv_rhou_dx_0_im2jk = q(i-2,j,indvars(1))*q(i-2,j,indvars(2))*q(i-2,j,indvars(2))+(param_float(3 + 5))*q(i-2,j,indvars(1))*((q(i-2,j,indvars(4))-&
                    0.5_wp*(q(i-2,j,indvars(2))*q(i-2,j,indvars(2))+&
                    q(i-2,j,indvars(3))*q(i-2,j,indvars(3)))))

d1_conv_rhou_dx_0_im1jk = q(i-1,j,indvars(1))*q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+(param_float(3 + 5))*q(i-1,j,indvars(1))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))

d1_conv_rhou_dx_0_ip1jk = q(i+1,j,indvars(1))*q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+(param_float(3 + 5))*q(i+1,j,indvars(1))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))

d1_conv_rhou_dx_0_ip2jk = q(i+2,j,indvars(1))*q(i+2,j,indvars(2))*q(i+2,j,indvars(2))+(param_float(3 + 5))*q(i+2,j,indvars(1))*((q(i+2,j,indvars(4))-&
                    0.5_wp*(q(i+2,j,indvars(2))*q(i+2,j,indvars(2))+&
                    q(i+2,j,indvars(3))*q(i+2,j,indvars(3)))))

d1_conv_rhou_dx_0_ijk = 0.08333333333333333_wp*d1_conv_rhou_dx_0_im2jk-&
          0.666666666666667_wp*d1_conv_rhou_dx_0_im1jk+&
          0.666666666666667_wp*d1_conv_rhou_dx_0_ip1jk-&
          0.08333333333333333_wp*d1_conv_rhou_dx_0_ip2jk

d1_conv_rhou_dx_0_ijk = d1_conv_rhou_dx_0_ijk*param_float(1)

d1_conv_rhou_dy_0_ijm2k = q(i,j-2,indvars(1))*q(i,j-2,indvars(3))*q(i,j-2,indvars(2))

d1_conv_rhou_dy_0_ijm1k = q(i,j-1,indvars(1))*q(i,j-1,indvars(3))*q(i,j-1,indvars(2))

d1_conv_rhou_dy_0_ijp1k = q(i,j+1,indvars(1))*q(i,j+1,indvars(3))*q(i,j+1,indvars(2))

d1_conv_rhou_dy_0_ijp2k = q(i,j+2,indvars(1))*q(i,j+2,indvars(3))*q(i,j+2,indvars(2))

d1_conv_rhou_dy_0_ijk = 0.08333333333333333_wp*d1_conv_rhou_dy_0_ijm2k-&
          0.666666666666667_wp*d1_conv_rhou_dy_0_ijm1k+&
          0.666666666666667_wp*d1_conv_rhou_dy_0_ijp1k-&
          0.08333333333333333_wp*d1_conv_rhou_dy_0_ijp2k

d1_conv_rhou_dy_0_ijk = d1_conv_rhou_dy_0_ijk*param_float(2)



!***********************************************************
!                                                           
! Update RHS terms for d(rho u)/dt *************************
!                                                           
!***********************************************************


rhs(i,j,indvars(2)) =   -  ( qst(i,j,indvarsst(10))*(d1_conv_rhou_dx_0_ijk)+&
                    qst(i,j,indvarsst(11))*(d1_conv_rhou_dy_0_ijk) ) 



!***********************************************************
!                                                           
! building source terms in RHS for d(rho v)/dt *************
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([rho*u*v]_1x)+deltayI*([rho*v*v+p]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_conv_rhov_dx_0_im2jk = q(i-2,j,indvars(1))*q(i-2,j,indvars(2))*q(i-2,j,indvars(3))

d1_conv_rhov_dx_0_im1jk = q(i-1,j,indvars(1))*q(i-1,j,indvars(2))*q(i-1,j,indvars(3))

d1_conv_rhov_dx_0_ip1jk = q(i+1,j,indvars(1))*q(i+1,j,indvars(2))*q(i+1,j,indvars(3))

d1_conv_rhov_dx_0_ip2jk = q(i+2,j,indvars(1))*q(i+2,j,indvars(2))*q(i+2,j,indvars(3))

d1_conv_rhov_dx_0_ijk = 0.08333333333333333_wp*d1_conv_rhov_dx_0_im2jk-&
          0.666666666666667_wp*d1_conv_rhov_dx_0_im1jk+&
          0.666666666666667_wp*d1_conv_rhov_dx_0_ip1jk-&
          0.08333333333333333_wp*d1_conv_rhov_dx_0_ip2jk

d1_conv_rhov_dx_0_ijk = d1_conv_rhov_dx_0_ijk*param_float(1)

d1_conv_rhov_dy_0_ijm2k = q(i,j-2,indvars(1))*q(i,j-2,indvars(3))*q(i,j-2,indvars(3))+(param_float(3 + 5))*q(i,j-2,indvars(1))*((q(i,j-2,indvars(4))-&
                    0.5_wp*(q(i,j-2,indvars(2))*q(i,j-2,indvars(2))+&
                    q(i,j-2,indvars(3))*q(i,j-2,indvars(3)))))

d1_conv_rhov_dy_0_ijm1k = q(i,j-1,indvars(1))*q(i,j-1,indvars(3))*q(i,j-1,indvars(3))+(param_float(3 + 5))*q(i,j-1,indvars(1))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))

d1_conv_rhov_dy_0_ijp1k = q(i,j+1,indvars(1))*q(i,j+1,indvars(3))*q(i,j+1,indvars(3))+(param_float(3 + 5))*q(i,j+1,indvars(1))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))

d1_conv_rhov_dy_0_ijp2k = q(i,j+2,indvars(1))*q(i,j+2,indvars(3))*q(i,j+2,indvars(3))+(param_float(3 + 5))*q(i,j+2,indvars(1))*((q(i,j+2,indvars(4))-&
                    0.5_wp*(q(i,j+2,indvars(2))*q(i,j+2,indvars(2))+&
                    q(i,j+2,indvars(3))*q(i,j+2,indvars(3)))))

d1_conv_rhov_dy_0_ijk = 0.08333333333333333_wp*d1_conv_rhov_dy_0_ijm2k-&
          0.666666666666667_wp*d1_conv_rhov_dy_0_ijm1k+&
          0.666666666666667_wp*d1_conv_rhov_dy_0_ijp1k-&
          0.08333333333333333_wp*d1_conv_rhov_dy_0_ijp2k

d1_conv_rhov_dy_0_ijk = d1_conv_rhov_dy_0_ijk*param_float(2)



!***********************************************************
!                                                           
! Update RHS terms for d(rho v)/dt *************************
!                                                           
!***********************************************************


rhs(i,j,indvars(3)) =   -  ( qst(i,j,indvarsst(10))*(d1_conv_rhov_dx_0_ijk)+&
                    qst(i,j,indvarsst(11))*(d1_conv_rhov_dy_0_ijk) ) 



!***********************************************************
!                                                           
! building source terms in RHS for d(rho et)/dt ************
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([(rho*et+p)*u]_1x)+deltayI*([(rho*et+p)*v]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_conv_et_dx_0_im2jk = (q(i-2,j,indvars(1))*q(i-2,j,indvars(4))+&
                    (param_float(3 + 5))*q(i-2,j,indvars(1))*((q(i-2,j,indvars(4))-&
                    0.5_wp*(q(i-2,j,indvars(2))*q(i-2,j,indvars(2))+&
                    q(i-2,j,indvars(3))*q(i-2,j,indvars(3))))))*q(i-2,j,indvars(2))

d1_conv_et_dx_0_im1jk = (q(i-1,j,indvars(1))*q(i-1,j,indvars(4))+&
                    (param_float(3 + 5))*q(i-1,j,indvars(1))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3))))))*q(i-1,j,indvars(2))

d1_conv_et_dx_0_ip1jk = (q(i+1,j,indvars(1))*q(i+1,j,indvars(4))+&
                    (param_float(3 + 5))*q(i+1,j,indvars(1))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3))))))*q(i+1,j,indvars(2))

d1_conv_et_dx_0_ip2jk = (q(i+2,j,indvars(1))*q(i+2,j,indvars(4))+&
                    (param_float(3 + 5))*q(i+2,j,indvars(1))*((q(i+2,j,indvars(4))-&
                    0.5_wp*(q(i+2,j,indvars(2))*q(i+2,j,indvars(2))+&
                    q(i+2,j,indvars(3))*q(i+2,j,indvars(3))))))*q(i+2,j,indvars(2))

d1_conv_et_dx_0_ijk = 0.08333333333333333_wp*d1_conv_et_dx_0_im2jk-&
          0.666666666666667_wp*d1_conv_et_dx_0_im1jk+&
          0.666666666666667_wp*d1_conv_et_dx_0_ip1jk-&
          0.08333333333333333_wp*d1_conv_et_dx_0_ip2jk

d1_conv_et_dx_0_ijk = d1_conv_et_dx_0_ijk*param_float(1)

d1_conv_et_dy_0_ijm2k = (q(i,j-2,indvars(1))*q(i,j-2,indvars(4))+&
                    (param_float(3 + 5))*q(i,j-2,indvars(1))*((q(i,j-2,indvars(4))-&
                    0.5_wp*(q(i,j-2,indvars(2))*q(i,j-2,indvars(2))+&
                    q(i,j-2,indvars(3))*q(i,j-2,indvars(3))))))*q(i,j-2,indvars(3))

d1_conv_et_dy_0_ijm1k = (q(i,j-1,indvars(1))*q(i,j-1,indvars(4))+&
                    (param_float(3 + 5))*q(i,j-1,indvars(1))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3))))))*q(i,j-1,indvars(3))

d1_conv_et_dy_0_ijp1k = (q(i,j+1,indvars(1))*q(i,j+1,indvars(4))+&
                    (param_float(3 + 5))*q(i,j+1,indvars(1))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3))))))*q(i,j+1,indvars(3))

d1_conv_et_dy_0_ijp2k = (q(i,j+2,indvars(1))*q(i,j+2,indvars(4))+&
                    (param_float(3 + 5))*q(i,j+2,indvars(1))*((q(i,j+2,indvars(4))-&
                    0.5_wp*(q(i,j+2,indvars(2))*q(i,j+2,indvars(2))+&
                    q(i,j+2,indvars(3))*q(i,j+2,indvars(3))))))*q(i,j+2,indvars(3))

d1_conv_et_dy_0_ijk = 0.08333333333333333_wp*d1_conv_et_dy_0_ijm2k-&
          0.666666666666667_wp*d1_conv_et_dy_0_ijm1k+&
          0.666666666666667_wp*d1_conv_et_dy_0_ijp1k-&
          0.08333333333333333_wp*d1_conv_et_dy_0_ijp2k

d1_conv_et_dy_0_ijk = d1_conv_et_dy_0_ijk*param_float(2)



!***********************************************************
!                                                           
! Update RHS terms for d(rho et)/dt ************************
!                                                           
!***********************************************************


rhs(i,j,indvars(4)) =   -  ( qst(i,j,indvarsst(10))*(d1_conv_et_dx_0_ijk)+&
                    qst(i,j,indvarsst(11))*(d1_conv_et_dy_0_ijk) ) 

     enddo
   enddo


!***********************************************************
!                                                           
! Start building RHS with source terms (2D) ****************
!                                                           
!***********************************************************


     do j=idloop(3),idloop(4) 
 
      do i=idloop(1),idloop(2) 


!***********************************************************
!                                                           
! building source terms in RHS for d(rho u)/dt *************
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([-visc_t*(2.0_wp*deltaxI*({u}_1x)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y)))]_1x)+deltayI*([-visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_dif_rhou_dxdx_0_0_im1jk_im1m1jk = q(i-1-1,j,indvars(2))

d2_dif_rhou_dxdx_0_0_im1jk_im1p1jk = q(i-1+1,j,indvars(2))

d2_dif_rhou_dxdx_0_0_im1jk = -&
          0.5_wp*d2_dif_rhou_dxdx_0_0_im1jk_im1m1jk+&
          0.5_wp*d2_dif_rhou_dxdx_0_0_im1jk_im1p1jk

d2_dif_rhou_dxdx_0_0_im1jk = d2_dif_rhou_dxdx_0_0_im1jk*param_float(1)

d2_dif_rhou_dxdx_0_0_ip1jk_ip1m1jk = q(i+1-1,j,indvars(2))

d2_dif_rhou_dxdx_0_0_ip1jk_ip1p1jk = q(i+1+1,j,indvars(2))

d2_dif_rhou_dxdx_0_0_ip1jk = -&
          0.5_wp*d2_dif_rhou_dxdx_0_0_ip1jk_ip1m1jk+&
          0.5_wp*d2_dif_rhou_dxdx_0_0_ip1jk_ip1p1jk

d2_dif_rhou_dxdx_0_0_ip1jk = d2_dif_rhou_dxdx_0_0_ip1jk*param_float(1)

d2_dif_rhou_dxdy_0_0_im1jk_im1jm1k = q(i-1,j-1,indvars(3))

d2_dif_rhou_dxdy_0_0_im1jk_im1jp1k = q(i-1,j+1,indvars(3))

d2_dif_rhou_dxdy_0_0_im1jk = -&
          0.5_wp*d2_dif_rhou_dxdy_0_0_im1jk_im1jm1k+&
          0.5_wp*d2_dif_rhou_dxdy_0_0_im1jk_im1jp1k

d2_dif_rhou_dxdy_0_0_im1jk = d2_dif_rhou_dxdy_0_0_im1jk*param_float(2)

d2_dif_rhou_dxdy_0_0_ip1jk_ip1jm1k = q(i+1,j-1,indvars(3))

d2_dif_rhou_dxdy_0_0_ip1jk_ip1jp1k = q(i+1,j+1,indvars(3))

d2_dif_rhou_dxdy_0_0_ip1jk = -&
          0.5_wp*d2_dif_rhou_dxdy_0_0_ip1jk_ip1jm1k+&
          0.5_wp*d2_dif_rhou_dxdy_0_0_ip1jk_ip1jp1k

d2_dif_rhou_dxdy_0_0_ip1jk = d2_dif_rhou_dxdy_0_0_ip1jk*param_float(2)

d1_dif_rhou_dx_0_im1jk = -((1+&
                    param_float(21 + 5))/(((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i-1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_im1jk)-&
                    2.0_wp/3.0_wp*(qst(i-1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_im1jk)+&
                    qst(i-1,j,indvarsst(11))*(d2_dif_rhou_dxdy_0_0_im1jk)))

d1_dif_rhou_dx_0_ip1jk = -((1+&
                    param_float(21 + 5))/(((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i+1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_ip1jk)-&
                    2.0_wp/3.0_wp*(qst(i+1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_ip1jk)+&
                    qst(i+1,j,indvarsst(11))*(d2_dif_rhou_dxdy_0_0_ip1jk)))

d1_dif_rhou_dx_0_ijk = -&
          0.5_wp*d1_dif_rhou_dx_0_im1jk+&
          0.5_wp*d1_dif_rhou_dx_0_ip1jk

d1_dif_rhou_dx_0_ijk = d1_dif_rhou_dx_0_ijk*param_float(1)

d2_dif_rhou_dydx_0_0_ijm1k_im1jm1k = q(i-1,j-1,indvars(3))

d2_dif_rhou_dydx_0_0_ijm1k_ip1jm1k = q(i+1,j-1,indvars(3))

d2_dif_rhou_dydx_0_0_ijm1k = -&
          0.5_wp*d2_dif_rhou_dydx_0_0_ijm1k_im1jm1k+&
          0.5_wp*d2_dif_rhou_dydx_0_0_ijm1k_ip1jm1k

d2_dif_rhou_dydx_0_0_ijm1k = d2_dif_rhou_dydx_0_0_ijm1k*param_float(1)

d2_dif_rhou_dydx_0_0_ijp1k_im1jp1k = q(i-1,j+1,indvars(3))

d2_dif_rhou_dydx_0_0_ijp1k_ip1jp1k = q(i+1,j+1,indvars(3))

d2_dif_rhou_dydx_0_0_ijp1k = -&
          0.5_wp*d2_dif_rhou_dydx_0_0_ijp1k_im1jp1k+&
          0.5_wp*d2_dif_rhou_dydx_0_0_ijp1k_ip1jp1k

d2_dif_rhou_dydx_0_0_ijp1k = d2_dif_rhou_dydx_0_0_ijp1k*param_float(1)

d2_dif_rhou_dydy_0_0_ijm1k_ijm1m1k = q(i,j-1-1,indvars(2))

d2_dif_rhou_dydy_0_0_ijm1k_ijm1p1k = q(i,j-1+1,indvars(2))

d2_dif_rhou_dydy_0_0_ijm1k = -&
          0.5_wp*d2_dif_rhou_dydy_0_0_ijm1k_ijm1m1k+&
          0.5_wp*d2_dif_rhou_dydy_0_0_ijm1k_ijm1p1k

d2_dif_rhou_dydy_0_0_ijm1k = d2_dif_rhou_dydy_0_0_ijm1k*param_float(2)

d2_dif_rhou_dydy_0_0_ijp1k_ijp1m1k = q(i,j+1-1,indvars(2))

d2_dif_rhou_dydy_0_0_ijp1k_ijp1p1k = q(i,j+1+1,indvars(2))

d2_dif_rhou_dydy_0_0_ijp1k = -&
          0.5_wp*d2_dif_rhou_dydy_0_0_ijp1k_ijp1m1k+&
          0.5_wp*d2_dif_rhou_dydy_0_0_ijp1k_ijp1p1k

d2_dif_rhou_dydy_0_0_ijp1k = d2_dif_rhou_dydy_0_0_ijp1k*param_float(2)

d1_dif_rhou_dy_0_ijm1k = -((1+&
                    param_float(21 + 5))/(((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i,j-1,indvarsst(11))*(d2_dif_rhou_dydy_0_0_ijm1k)+&
                    qst(i,j-1,indvarsst(10))*(d2_dif_rhou_dydx_0_0_ijm1k))

d1_dif_rhou_dy_0_ijp1k = -((1+&
                    param_float(21 + 5))/(((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i,j+1,indvarsst(11))*(d2_dif_rhou_dydy_0_0_ijp1k)+&
                    qst(i,j+1,indvarsst(10))*(d2_dif_rhou_dydx_0_0_ijp1k))

d1_dif_rhou_dy_0_ijk = -&
          0.5_wp*d1_dif_rhou_dy_0_ijm1k+&
          0.5_wp*d1_dif_rhou_dy_0_ijp1k

d1_dif_rhou_dy_0_ijk = d1_dif_rhou_dy_0_ijk*param_float(2)



!***********************************************************
!                                                           
! Update RHS terms for d(rho u)/dt *************************
!                                                           
!***********************************************************


rhs(i,j,indvars(2)) = rhs(i,j,indvars(2))  -  ( qst(i,j,indvarsst(10))*(d1_dif_rhou_dx_0_ijk)+&
                    qst(i,j,indvarsst(11))*(d1_dif_rhou_dy_0_ijk) ) 



!***********************************************************
!                                                           
! building source terms in RHS for d(rho v)/dt *************
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([-visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x))]_1x)+deltayI*([-visc_t*(2.0_wp*deltayI*({v}_1y)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y)))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_dif_rhov_dxdx_0_0_im1jk_im1m1jk = q(i-1-1,j,indvars(3))

d2_dif_rhov_dxdx_0_0_im1jk_im1p1jk = q(i-1+1,j,indvars(3))

d2_dif_rhov_dxdx_0_0_im1jk = -&
          0.5_wp*d2_dif_rhov_dxdx_0_0_im1jk_im1m1jk+&
          0.5_wp*d2_dif_rhov_dxdx_0_0_im1jk_im1p1jk

d2_dif_rhov_dxdx_0_0_im1jk = d2_dif_rhov_dxdx_0_0_im1jk*param_float(1)

d2_dif_rhov_dxdx_0_0_ip1jk_ip1m1jk = q(i+1-1,j,indvars(3))

d2_dif_rhov_dxdx_0_0_ip1jk_ip1p1jk = q(i+1+1,j,indvars(3))

d2_dif_rhov_dxdx_0_0_ip1jk = -&
          0.5_wp*d2_dif_rhov_dxdx_0_0_ip1jk_ip1m1jk+&
          0.5_wp*d2_dif_rhov_dxdx_0_0_ip1jk_ip1p1jk

d2_dif_rhov_dxdx_0_0_ip1jk = d2_dif_rhov_dxdx_0_0_ip1jk*param_float(1)

d2_dif_rhov_dxdy_0_0_im1jk_im1jm1k = q(i-1,j-1,indvars(2))

d2_dif_rhov_dxdy_0_0_im1jk_im1jp1k = q(i-1,j+1,indvars(2))

d2_dif_rhov_dxdy_0_0_im1jk = -&
          0.5_wp*d2_dif_rhov_dxdy_0_0_im1jk_im1jm1k+&
          0.5_wp*d2_dif_rhov_dxdy_0_0_im1jk_im1jp1k

d2_dif_rhov_dxdy_0_0_im1jk = d2_dif_rhov_dxdy_0_0_im1jk*param_float(2)

d2_dif_rhov_dxdy_0_0_ip1jk_ip1jm1k = q(i+1,j-1,indvars(2))

d2_dif_rhov_dxdy_0_0_ip1jk_ip1jp1k = q(i+1,j+1,indvars(2))

d2_dif_rhov_dxdy_0_0_ip1jk = -&
          0.5_wp*d2_dif_rhov_dxdy_0_0_ip1jk_ip1jm1k+&
          0.5_wp*d2_dif_rhov_dxdy_0_0_ip1jk_ip1jp1k

d2_dif_rhov_dxdy_0_0_ip1jk = d2_dif_rhov_dxdy_0_0_ip1jk*param_float(2)

d1_dif_rhov_dx_0_im1jk = -((1+&
                    param_float(21 + 5))/(((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i-1,j,indvarsst(11))*(d2_dif_rhov_dxdy_0_0_im1jk)+&
                    qst(i-1,j,indvarsst(10))*(d2_dif_rhov_dxdx_0_0_im1jk))

d1_dif_rhov_dx_0_ip1jk = -((1+&
                    param_float(21 + 5))/(((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i+1,j,indvarsst(11))*(d2_dif_rhov_dxdy_0_0_ip1jk)+&
                    qst(i+1,j,indvarsst(10))*(d2_dif_rhov_dxdx_0_0_ip1jk))

d1_dif_rhov_dx_0_ijk = -&
          0.5_wp*d1_dif_rhov_dx_0_im1jk+&
          0.5_wp*d1_dif_rhov_dx_0_ip1jk

d1_dif_rhov_dx_0_ijk = d1_dif_rhov_dx_0_ijk*param_float(1)

d2_dif_rhov_dydx_0_0_ijm1k_im1jm1k = q(i-1,j-1,indvars(2))

d2_dif_rhov_dydx_0_0_ijm1k_ip1jm1k = q(i+1,j-1,indvars(2))

d2_dif_rhov_dydx_0_0_ijm1k = -&
          0.5_wp*d2_dif_rhov_dydx_0_0_ijm1k_im1jm1k+&
          0.5_wp*d2_dif_rhov_dydx_0_0_ijm1k_ip1jm1k

d2_dif_rhov_dydx_0_0_ijm1k = d2_dif_rhov_dydx_0_0_ijm1k*param_float(1)

d2_dif_rhov_dydx_0_0_ijp1k_im1jp1k = q(i-1,j+1,indvars(2))

d2_dif_rhov_dydx_0_0_ijp1k_ip1jp1k = q(i+1,j+1,indvars(2))

d2_dif_rhov_dydx_0_0_ijp1k = -&
          0.5_wp*d2_dif_rhov_dydx_0_0_ijp1k_im1jp1k+&
          0.5_wp*d2_dif_rhov_dydx_0_0_ijp1k_ip1jp1k

d2_dif_rhov_dydx_0_0_ijp1k = d2_dif_rhov_dydx_0_0_ijp1k*param_float(1)

d2_dif_rhov_dydy_0_0_ijm1k_ijm1m1k = q(i,j-1-1,indvars(3))

d2_dif_rhov_dydy_0_0_ijm1k_ijm1p1k = q(i,j-1+1,indvars(3))

d2_dif_rhov_dydy_0_0_ijm1k = -&
          0.5_wp*d2_dif_rhov_dydy_0_0_ijm1k_ijm1m1k+&
          0.5_wp*d2_dif_rhov_dydy_0_0_ijm1k_ijm1p1k

d2_dif_rhov_dydy_0_0_ijm1k = d2_dif_rhov_dydy_0_0_ijm1k*param_float(2)

d2_dif_rhov_dydy_0_0_ijp1k_ijp1m1k = q(i,j+1-1,indvars(3))

d2_dif_rhov_dydy_0_0_ijp1k_ijp1p1k = q(i,j+1+1,indvars(3))

d2_dif_rhov_dydy_0_0_ijp1k = -&
          0.5_wp*d2_dif_rhov_dydy_0_0_ijp1k_ijp1m1k+&
          0.5_wp*d2_dif_rhov_dydy_0_0_ijp1k_ijp1p1k

d2_dif_rhov_dydy_0_0_ijp1k = d2_dif_rhov_dydy_0_0_ijp1k*param_float(2)

d1_dif_rhov_dy_0_ijm1k = -((1+&
                    param_float(21 + 5))/(((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i,j-1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijm1k)-&
                    2.0_wp/3.0_wp*(qst(i,j-1,indvarsst(10))*(d2_dif_rhov_dydx_0_0_ijm1k)+&
                    qst(i,j-1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijm1k)))

d1_dif_rhov_dy_0_ijp1k = -((1+&
                    param_float(21 + 5))/(((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i,j+1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijp1k)-&
                    2.0_wp/3.0_wp*(qst(i,j+1,indvarsst(10))*(d2_dif_rhov_dydx_0_0_ijp1k)+&
                    qst(i,j+1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijp1k)))

d1_dif_rhov_dy_0_ijk = -&
          0.5_wp*d1_dif_rhov_dy_0_ijm1k+&
          0.5_wp*d1_dif_rhov_dy_0_ijp1k

d1_dif_rhov_dy_0_ijk = d1_dif_rhov_dy_0_ijk*param_float(2)



!***********************************************************
!                                                           
! Update RHS terms for d(rho v)/dt *************************
!                                                           
!***********************************************************


rhs(i,j,indvars(3)) = rhs(i,j,indvars(3))  -  ( qst(i,j,indvarsst(10))*(d1_dif_rhov_dx_0_ijk)+&
                    qst(i,j,indvarsst(11))*(d1_dif_rhov_dy_0_ijk) ) 



!***********************************************************
!                                                           
! building source terms in RHS for d(rho et)/dt ************
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([-kappa*deltaxI*({T}_1x)-u*(visc_t*(2.0_wp*deltaxI*({u}_1x)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y))))-v*(visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x)))]_1x)+deltayI*([-kappa*deltayI*({T}_1y)-u*(visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x)))-v*(visc_t*(2.0_wp*deltayI*({v}_1y)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y))))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_dif_et_dxdx_0_0_im1jk_im1m1jk = ((q(i-1-1,j,indvars(4))-&
                    0.5_wp*(q(i-1-1,j,indvars(2))*q(i-1-1,j,indvars(2))+&
                    q(i-1-1,j,indvars(3))*q(i-1-1,j,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dxdx_0_0_im1jk_im1p1jk = ((q(i-1+1,j,indvars(4))-&
                    0.5_wp*(q(i-1+1,j,indvars(2))*q(i-1+1,j,indvars(2))+&
                    q(i-1+1,j,indvars(3))*q(i-1+1,j,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dxdx_0_0_im1jk = -&
          0.5_wp*d2_dif_et_dxdx_0_0_im1jk_im1m1jk+&
          0.5_wp*d2_dif_et_dxdx_0_0_im1jk_im1p1jk

d2_dif_et_dxdx_0_0_im1jk = d2_dif_et_dxdx_0_0_im1jk*param_float(1)

d2_dif_et_dxdx_0_0_ip1jk_ip1m1jk = ((q(i+1-1,j,indvars(4))-&
                    0.5_wp*(q(i+1-1,j,indvars(2))*q(i+1-1,j,indvars(2))+&
                    q(i+1-1,j,indvars(3))*q(i+1-1,j,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dxdx_0_0_ip1jk_ip1p1jk = ((q(i+1+1,j,indvars(4))-&
                    0.5_wp*(q(i+1+1,j,indvars(2))*q(i+1+1,j,indvars(2))+&
                    q(i+1+1,j,indvars(3))*q(i+1+1,j,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dxdx_0_0_ip1jk = -&
          0.5_wp*d2_dif_et_dxdx_0_0_ip1jk_ip1m1jk+&
          0.5_wp*d2_dif_et_dxdx_0_0_ip1jk_ip1p1jk

d2_dif_et_dxdx_0_0_ip1jk = d2_dif_et_dxdx_0_0_ip1jk*param_float(1)

d1_dif_et_dx_0_im1jk = -param_float(2 + 5)*qst(i-1,j,indvarsst(10))*(d2_dif_et_dxdx_0_0_im1jk)-&
                    q(i-1,j,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i-1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_im1jk)-&
                    2.0_wp/3.0_wp*(qst(i-1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_im1jk)+&
                    qst(i-1,j,indvarsst(11))*(d2_dif_rhou_dxdy_0_0_im1jk))))-&
                    q(i-1,j,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i-1,j,indvarsst(11))*(d2_dif_rhov_dxdy_0_0_im1jk)+&
                    qst(i-1,j,indvarsst(10))*(d2_dif_rhov_dxdx_0_0_im1jk)))

d1_dif_et_dx_0_ip1jk = -param_float(2 + 5)*qst(i+1,j,indvarsst(10))*(d2_dif_et_dxdx_0_0_ip1jk)-&
                    q(i+1,j,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i+1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_ip1jk)-&
                    2.0_wp/3.0_wp*(qst(i+1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_ip1jk)+&
                    qst(i+1,j,indvarsst(11))*(d2_dif_rhou_dxdy_0_0_ip1jk))))-&
                    q(i+1,j,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i+1,j,indvarsst(11))*(d2_dif_rhov_dxdy_0_0_ip1jk)+&
                    qst(i+1,j,indvarsst(10))*(d2_dif_rhov_dxdx_0_0_ip1jk)))

d1_dif_et_dx_0_ijk = -&
          0.5_wp*d1_dif_et_dx_0_im1jk+&
          0.5_wp*d1_dif_et_dx_0_ip1jk

d1_dif_et_dx_0_ijk = d1_dif_et_dx_0_ijk*param_float(1)

d2_dif_et_dydy_0_0_ijm1k_ijm1m1k = ((q(i,j-1-1,indvars(4))-&
                    0.5_wp*(q(i,j-1-1,indvars(2))*q(i,j-1-1,indvars(2))+&
                    q(i,j-1-1,indvars(3))*q(i,j-1-1,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dydy_0_0_ijm1k_ijm1p1k = ((q(i,j-1+1,indvars(4))-&
                    0.5_wp*(q(i,j-1+1,indvars(2))*q(i,j-1+1,indvars(2))+&
                    q(i,j-1+1,indvars(3))*q(i,j-1+1,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dydy_0_0_ijm1k = -&
          0.5_wp*d2_dif_et_dydy_0_0_ijm1k_ijm1m1k+&
          0.5_wp*d2_dif_et_dydy_0_0_ijm1k_ijm1p1k

d2_dif_et_dydy_0_0_ijm1k = d2_dif_et_dydy_0_0_ijm1k*param_float(2)

d2_dif_et_dydy_0_0_ijp1k_ijp1m1k = ((q(i,j+1-1,indvars(4))-&
                    0.5_wp*(q(i,j+1-1,indvars(2))*q(i,j+1-1,indvars(2))+&
                    q(i,j+1-1,indvars(3))*q(i,j+1-1,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dydy_0_0_ijp1k_ijp1p1k = ((q(i,j+1+1,indvars(4))-&
                    0.5_wp*(q(i,j+1+1,indvars(2))*q(i,j+1+1,indvars(2))+&
                    q(i,j+1+1,indvars(3))*q(i,j+1+1,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dydy_0_0_ijp1k = -&
          0.5_wp*d2_dif_et_dydy_0_0_ijp1k_ijp1m1k+&
          0.5_wp*d2_dif_et_dydy_0_0_ijp1k_ijp1p1k

d2_dif_et_dydy_0_0_ijp1k = d2_dif_et_dydy_0_0_ijp1k*param_float(2)

d1_dif_et_dy_0_ijm1k = -param_float(2 + 5)*qst(i,j-1,indvarsst(11))*(d2_dif_et_dydy_0_0_ijm1k)-&
                    q(i,j-1,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i,j-1,indvarsst(11))*(d2_dif_rhou_dydy_0_0_ijm1k)+&
                    qst(i,j-1,indvarsst(10))*(d2_dif_rhou_dydx_0_0_ijm1k)))-&
                    q(i,j-1,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i,j-1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijm1k)-&
                    2.0_wp/3.0_wp*(qst(i,j-1,indvarsst(10))*(d2_dif_rhov_dydx_0_0_ijm1k)+&
                    qst(i,j-1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijm1k))))

d1_dif_et_dy_0_ijp1k = -param_float(2 + 5)*qst(i,j+1,indvarsst(11))*(d2_dif_et_dydy_0_0_ijp1k)-&
                    q(i,j+1,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i,j+1,indvarsst(11))*(d2_dif_rhou_dydy_0_0_ijp1k)+&
                    qst(i,j+1,indvarsst(10))*(d2_dif_rhou_dydx_0_0_ijp1k)))-&
                    q(i,j+1,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i,j+1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijp1k)-&
                    2.0_wp/3.0_wp*(qst(i,j+1,indvarsst(10))*(d2_dif_rhov_dydx_0_0_ijp1k)+&
                    qst(i,j+1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijp1k))))

d1_dif_et_dy_0_ijk = -&
          0.5_wp*d1_dif_et_dy_0_ijm1k+&
          0.5_wp*d1_dif_et_dy_0_ijp1k

d1_dif_et_dy_0_ijk = d1_dif_et_dy_0_ijk*param_float(2)



!***********************************************************
!                                                           
! Update RHS terms for d(rho et)/dt ************************
!                                                           
!***********************************************************


rhs(i,j,indvars(4)) = rhs(i,j,indvars(4))  -  ( qst(i,j,indvarsst(10))*(d1_dif_et_dx_0_ijk)+&
                    qst(i,j,indvarsst(11))*(d1_dif_et_dy_0_ijk) ) 

     enddo
   enddo
