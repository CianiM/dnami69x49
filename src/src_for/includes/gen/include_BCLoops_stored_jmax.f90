

!***********************************************************
!                                                           
! Start building layers for BC : None jmax None ************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: None 0 None ************************************
!                                                           
!***********************************************************


 
      do i=idloop(1),idloop(2) 


!***********************************************************
!                                                           
! building source terms in RHS for layer None 0 None stemp *
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (((0.5_wp*(deltayI*([u]_1y)-deltaxI*([v]_1x)))**2+(0.5_wp*(deltaxI*([v]_1x)-deltayI*([u]_1y)))**2)*2)**0.5
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_stemp_dx_0_im1nyp2p0k = q(i-1,ny+2+0,indvars(3))

d1_stemp_dx_0_ip1nyp2p0k = q(i+1,ny+2+0,indvars(3))

d1_stemp_dx_0_inyp2p0k = -&
          0.5_wp*d1_stemp_dx_0_im1nyp2p0k+&
          0.5_wp*d1_stemp_dx_0_ip1nyp2p0k

d1_stemp_dx_0_inyp2p0k = d1_stemp_dx_0_inyp2p0k*param_float(1)

d1_stemp_dy_0_inyp2p0p0k = q(i,ny+2+0+0,indvars(2))

d1_stemp_dy_0_inyp2p0m1k = q(i,ny+2+0-1,indvars(2))

d1_stemp_dy_0_inyp2p0m2k = q(i,ny+2+0-2,indvars(2))

d1_stemp_dy_0_inyp2p0k = 1.5_wp*d1_stemp_dy_0_inyp2p0p0k-&
          2.0_wp*d1_stemp_dy_0_inyp2p0m1k+&
          0.5_wp*d1_stemp_dy_0_inyp2p0m2k

d1_stemp_dy_0_inyp2p0k = d1_stemp_dy_0_inyp2p0k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None 0 None stemp **************
!                                                           
!***********************************************************


qst(i,ny+2+0,indvarsst(4)) =  (((0.5_wp*(qst(i,ny+2+0,indvarsst(11))*(d1_stemp_dy_0_inyp2p0k)-&
                    qst(i,ny+2+0,indvarsst(10))*(d1_stemp_dx_0_inyp2p0k)))**2+&
                    (0.5_wp*(qst(i,ny+2+0,indvarsst(10))*(d1_stemp_dx_0_inyp2p0k)-&
                    qst(i,ny+2+0,indvarsst(11))*(d1_stemp_dy_0_inyp2p0k)))**2)*2)**0.5

   enddo


!***********************************************************
!                                                           
! Start building layers for BC : None jmax None ************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: None 1 None ************************************
!                                                           
!***********************************************************


 
      do i=idloop(1),idloop(2) 


!***********************************************************
!                                                           
! building source terms in RHS for layer None 1 None stemp *
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! (((0.5_wp*(deltayI*([u]_1y)-deltaxI*([v]_1x)))**2+(0.5_wp*(deltaxI*([v]_1x)-deltayI*([u]_1y)))**2)*2)**0.5
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_stemp_dx_0_im1nyp2m1k = q(i-1,ny+2-1,indvars(3))

d1_stemp_dx_0_ip1nyp2m1k = q(i+1,ny+2-1,indvars(3))

d1_stemp_dx_0_inyp2m1k = -&
          0.5_wp*d1_stemp_dx_0_im1nyp2m1k+&
          0.5_wp*d1_stemp_dx_0_ip1nyp2m1k

d1_stemp_dx_0_inyp2m1k = d1_stemp_dx_0_inyp2m1k*param_float(1)

d1_stemp_dy_0_inyp2m1m1k = q(i,ny+2-1-1,indvars(2))

d1_stemp_dy_0_inyp2m1p1k = q(i,ny+2-1+1,indvars(2))

d1_stemp_dy_0_inyp2m1k = -&
          0.5_wp*d1_stemp_dy_0_inyp2m1m1k+&
          0.5_wp*d1_stemp_dy_0_inyp2m1p1k

d1_stemp_dy_0_inyp2m1k = d1_stemp_dy_0_inyp2m1k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None 1 None stemp **************
!                                                           
!***********************************************************


qst(i,ny+2-1,indvarsst(4)) =  (((0.5_wp*(qst(i,ny+2-1,indvarsst(11))*(d1_stemp_dy_0_inyp2m1k)-&
                    qst(i,ny+2-1,indvarsst(10))*(d1_stemp_dx_0_inyp2m1k)))**2+&
                    (0.5_wp*(qst(i,ny+2-1,indvarsst(10))*(d1_stemp_dx_0_inyp2m1k)-&
                    qst(i,ny+2-1,indvarsst(11))*(d1_stemp_dy_0_inyp2m1k)))**2)*2)**0.5

   enddo
