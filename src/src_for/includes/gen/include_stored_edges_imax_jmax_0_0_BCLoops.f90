

!***********************************************************
!                                                           
! Start building layers for BC : imax jmax None ************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: 0 0 None ***************************************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None stemp ****
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (((0.5_wp*(deltayI*([u]_1y)-deltaxI*([v]_1x)))**2+(0.5_wp*(deltaxI*([v]_1x)-deltayI*([u]_1y)))**2)*2)**0.5
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_stemp_dx_0_nxp2p0p0nyp2p0k = q(nx+2+0+0,ny+2+0,indvars(3))

d1_stemp_dx_0_nxp2p0m1nyp2p0k = q(nx+2+0-1,ny+2+0,indvars(3))

d1_stemp_dx_0_nxp2p0m2nyp2p0k = q(nx+2+0-2,ny+2+0,indvars(3))

d1_stemp_dx_0_nxp2p0nyp2p0k = 1.5_wp*d1_stemp_dx_0_nxp2p0p0nyp2p0k-&
          2.0_wp*d1_stemp_dx_0_nxp2p0m1nyp2p0k+&
          0.5_wp*d1_stemp_dx_0_nxp2p0m2nyp2p0k

d1_stemp_dx_0_nxp2p0nyp2p0k = d1_stemp_dx_0_nxp2p0nyp2p0k*param_float(1)

d1_stemp_dy_0_nxp2p0nyp2p0p0k = q(nx+2+0,ny+2+0+0,indvars(2))

d1_stemp_dy_0_nxp2p0nyp2p0m1k = q(nx+2+0,ny+2+0-1,indvars(2))

d1_stemp_dy_0_nxp2p0nyp2p0m2k = q(nx+2+0,ny+2+0-2,indvars(2))

d1_stemp_dy_0_nxp2p0nyp2p0k = 1.5_wp*d1_stemp_dy_0_nxp2p0nyp2p0p0k-&
          2.0_wp*d1_stemp_dy_0_nxp2p0nyp2p0m1k+&
          0.5_wp*d1_stemp_dy_0_nxp2p0nyp2p0m2k

d1_stemp_dy_0_nxp2p0nyp2p0k = d1_stemp_dy_0_nxp2p0nyp2p0k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None stemp *****************
!                                                           
!***********************************************************


qst(nx+2+0,ny+2+0,indvarsst(4)) =  (((0.5_wp*(qst(nx+2+0,ny+2+0,indvarsst(11))*(d1_stemp_dy_0_nxp2p0nyp2p0k)-&
                    qst(nx+2+0,ny+2+0,indvarsst(10))*(d1_stemp_dx_0_nxp2p0nyp2p0k)))**2+&
                    (0.5_wp*(qst(nx+2+0,ny+2+0,indvarsst(10))*(d1_stemp_dx_0_nxp2p0nyp2p0k)-&
                    qst(nx+2+0,ny+2+0,indvarsst(11))*(d1_stemp_dy_0_nxp2p0nyp2p0k)))**2)*2)**0.5

