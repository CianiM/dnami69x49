

!***********************************************************
!                                                           
! Start building layers for BC : i1 None None **************
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

d1_stemp_dx_0_1m2p0p0jk = q(1-2+0+0,j,indvars(3))

d1_stemp_dx_0_1m2p0p1jk = q(1-2+0+1,j,indvars(3))

d1_stemp_dx_0_1m2p0p2jk = q(1-2+0+2,j,indvars(3))

d1_stemp_dx_0_1m2p0jk = -&
          1.5_wp*d1_stemp_dx_0_1m2p0p0jk+&
          2.0_wp*d1_stemp_dx_0_1m2p0p1jk-&
          0.5_wp*d1_stemp_dx_0_1m2p0p2jk

d1_stemp_dx_0_1m2p0jk = d1_stemp_dx_0_1m2p0jk*param_float(1)

d1_stemp_dy_0_1m2p0jm1k = q(1-2+0,j-1,indvars(2))

d1_stemp_dy_0_1m2p0jp1k = q(1-2+0,j+1,indvars(2))

d1_stemp_dy_0_1m2p0jk = -&
          0.5_wp*d1_stemp_dy_0_1m2p0jm1k+&
          0.5_wp*d1_stemp_dy_0_1m2p0jp1k

d1_stemp_dy_0_1m2p0jk = d1_stemp_dy_0_1m2p0jk*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 0 None None stemp **************
!                                                           
!***********************************************************


qst(1-2+0,j,indvarsst(4)) =  (((0.5_wp*(qst(1-2+0,j,indvarsst(11))*(d1_stemp_dy_0_1m2p0jk)-&
                    qst(1-2+0,j,indvarsst(10))*(d1_stemp_dx_0_1m2p0jk)))**2+&
                    (0.5_wp*(qst(1-2+0,j,indvarsst(10))*(d1_stemp_dx_0_1m2p0jk)-&
                    qst(1-2+0,j,indvarsst(11))*(d1_stemp_dy_0_1m2p0jk)))**2)*2)**0.5

     enddo


!***********************************************************
!                                                           
! Start building layers for BC : i1 None None **************
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

d1_stemp_dx_0_1m2p1m1jk = q(1-2+1-1,j,indvars(3))

d1_stemp_dx_0_1m2p1p1jk = q(1-2+1+1,j,indvars(3))

d1_stemp_dx_0_1m2p1jk = -&
          0.5_wp*d1_stemp_dx_0_1m2p1m1jk+&
          0.5_wp*d1_stemp_dx_0_1m2p1p1jk

d1_stemp_dx_0_1m2p1jk = d1_stemp_dx_0_1m2p1jk*param_float(1)

d1_stemp_dy_0_1m2p1jm1k = q(1-2+1,j-1,indvars(2))

d1_stemp_dy_0_1m2p1jp1k = q(1-2+1,j+1,indvars(2))

d1_stemp_dy_0_1m2p1jk = -&
          0.5_wp*d1_stemp_dy_0_1m2p1jm1k+&
          0.5_wp*d1_stemp_dy_0_1m2p1jp1k

d1_stemp_dy_0_1m2p1jk = d1_stemp_dy_0_1m2p1jk*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 1 None None stemp **************
!                                                           
!***********************************************************


qst(1-2+1,j,indvarsst(4)) =  (((0.5_wp*(qst(1-2+1,j,indvarsst(11))*(d1_stemp_dy_0_1m2p1jk)-&
                    qst(1-2+1,j,indvarsst(10))*(d1_stemp_dx_0_1m2p1jk)))**2+&
                    (0.5_wp*(qst(1-2+1,j,indvarsst(10))*(d1_stemp_dx_0_1m2p1jk)-&
                    qst(1-2+1,j,indvarsst(11))*(d1_stemp_dy_0_1m2p1jk)))**2)*2)**0.5

     enddo
