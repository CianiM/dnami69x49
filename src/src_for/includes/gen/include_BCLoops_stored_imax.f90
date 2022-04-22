

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
! building source terms in RHS for layer 0 None None stemp *
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (((0.5_wp*(deltayI*([u]_1y)-deltaxI*([v]_1x)))**2+(0.5_wp*(deltaxI*([v]_1x)-deltayI*([u]_1y)))**2)*2)**0.5
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_stemp_dx_0_nxp2p0p0jk = q(nx+2+0+0,j,indvars(3))

d1_stemp_dx_0_nxp2p0m1jk = q(nx+2+0-1,j,indvars(3))

d1_stemp_dx_0_nxp2p0m2jk = q(nx+2+0-2,j,indvars(3))

d1_stemp_dx_0_nxp2p0jk = 1.5_wp*d1_stemp_dx_0_nxp2p0p0jk-&
          2.0_wp*d1_stemp_dx_0_nxp2p0m1jk+&
          0.5_wp*d1_stemp_dx_0_nxp2p0m2jk

d1_stemp_dx_0_nxp2p0jk = d1_stemp_dx_0_nxp2p0jk*param_float(1)

d1_stemp_dy_0_nxp2p0jm1k = q(nx+2+0,j-1,indvars(2))

d1_stemp_dy_0_nxp2p0jp1k = q(nx+2+0,j+1,indvars(2))

d1_stemp_dy_0_nxp2p0jk = -&
          0.5_wp*d1_stemp_dy_0_nxp2p0jm1k+&
          0.5_wp*d1_stemp_dy_0_nxp2p0jp1k

d1_stemp_dy_0_nxp2p0jk = d1_stemp_dy_0_nxp2p0jk*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 None None stemp **************
!                                                           
!***********************************************************


qst(nx+2+0,j,indvarsst(4)) =  (((0.5_wp*(qst(nx+2+0,j,indvarsst(11))*(d1_stemp_dy_0_nxp2p0jk)-&
                    qst(nx+2+0,j,indvarsst(10))*(d1_stemp_dx_0_nxp2p0jk)))**2+&
                    (0.5_wp*(qst(nx+2+0,j,indvarsst(10))*(d1_stemp_dx_0_nxp2p0jk)-&
                    qst(nx+2+0,j,indvarsst(11))*(d1_stemp_dy_0_nxp2p0jk)))**2)*2)**0.5

     enddo


!***********************************************************
!                                                           
! Start building layers for BC : imax None None ************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: 1 None None ************************************
!                                                           
!***********************************************************


     do j=idloop(3),idloop(4) 


!***********************************************************
!                                                           
! building source terms in RHS for layer 1 None None stemp *
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (((0.5_wp*(deltayI*([u]_1y)-deltaxI*([v]_1x)))**2+(0.5_wp*(deltaxI*([v]_1x)-deltayI*([u]_1y)))**2)*2)**0.5
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_stemp_dx_0_nxp2m1m1jk = q(nx+2-1-1,j,indvars(3))

d1_stemp_dx_0_nxp2m1p1jk = q(nx+2-1+1,j,indvars(3))

d1_stemp_dx_0_nxp2m1jk = -&
          0.5_wp*d1_stemp_dx_0_nxp2m1m1jk+&
          0.5_wp*d1_stemp_dx_0_nxp2m1p1jk

d1_stemp_dx_0_nxp2m1jk = d1_stemp_dx_0_nxp2m1jk*param_float(1)

d1_stemp_dy_0_nxp2m1jm1k = q(nx+2-1,j-1,indvars(2))

d1_stemp_dy_0_nxp2m1jp1k = q(nx+2-1,j+1,indvars(2))

d1_stemp_dy_0_nxp2m1jk = -&
          0.5_wp*d1_stemp_dy_0_nxp2m1jm1k+&
          0.5_wp*d1_stemp_dy_0_nxp2m1jp1k

d1_stemp_dy_0_nxp2m1jk = d1_stemp_dy_0_nxp2m1jk*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 1 None None stemp **************
!                                                           
!***********************************************************


qst(nx+2-1,j,indvarsst(4)) =  (((0.5_wp*(qst(nx+2-1,j,indvarsst(11))*(d1_stemp_dy_0_nxp2m1jk)-&
                    qst(nx+2-1,j,indvarsst(10))*(d1_stemp_dx_0_nxp2m1jk)))**2+&
                    (0.5_wp*(qst(nx+2-1,j,indvarsst(10))*(d1_stemp_dx_0_nxp2m1jk)-&
                    qst(nx+2-1,j,indvarsst(11))*(d1_stemp_dy_0_nxp2m1jk)))**2)*2)**0.5

     enddo
