

!***********************************************************
!                                                           
! Start building layers for BC : imax jmax None ************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: 1 1 None ***************************************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! building source terms in RHS for layer 1 1 None stemp ****
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (((0.5_wp*(deltayI*([u]_1y)-deltaxI*([v]_1x)))**2+(0.5_wp*(deltaxI*([v]_1x)-deltayI*([u]_1y)))**2)*2)**0.5
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_stemp_dx_0_nxp2m1m1nyp2m1k = q(nx+2-1-1,ny+2-1,indvars(3))

d1_stemp_dx_0_nxp2m1p1nyp2m1k = q(nx+2-1+1,ny+2-1,indvars(3))

d1_stemp_dx_0_nxp2m1nyp2m1k = -&
          0.5_wp*d1_stemp_dx_0_nxp2m1m1nyp2m1k+&
          0.5_wp*d1_stemp_dx_0_nxp2m1p1nyp2m1k

d1_stemp_dx_0_nxp2m1nyp2m1k = d1_stemp_dx_0_nxp2m1nyp2m1k*param_float(1)

d1_stemp_dy_0_nxp2m1nyp2m1m1k = q(nx+2-1,ny+2-1-1,indvars(2))

d1_stemp_dy_0_nxp2m1nyp2m1p1k = q(nx+2-1,ny+2-1+1,indvars(2))

d1_stemp_dy_0_nxp2m1nyp2m1k = -&
          0.5_wp*d1_stemp_dy_0_nxp2m1nyp2m1m1k+&
          0.5_wp*d1_stemp_dy_0_nxp2m1nyp2m1p1k

d1_stemp_dy_0_nxp2m1nyp2m1k = d1_stemp_dy_0_nxp2m1nyp2m1k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 1 1 None stemp *****************
!                                                           
!***********************************************************


qst(nx+2-1,ny+2-1,indvarsst(4)) =  (((0.5_wp*(qst(nx+2-1,ny+2-1,indvarsst(11))*(d1_stemp_dy_0_nxp2m1nyp2m1k)-&
                    qst(nx+2-1,ny+2-1,indvarsst(10))*(d1_stemp_dx_0_nxp2m1nyp2m1k)))**2+&
                    (0.5_wp*(qst(nx+2-1,ny+2-1,indvarsst(10))*(d1_stemp_dx_0_nxp2m1nyp2m1k)-&
                    qst(nx+2-1,ny+2-1,indvarsst(11))*(d1_stemp_dy_0_nxp2m1nyp2m1k)))**2)*2)**0.5

