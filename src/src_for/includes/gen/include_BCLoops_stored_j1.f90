

!***********************************************************
!                                                           
! Start building layers for BC : None j1 None **************
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

d1_stemp_dx_0_im11m2p0k = q(i-1,1-2+0,indvars(3))

d1_stemp_dx_0_ip11m2p0k = q(i+1,1-2+0,indvars(3))

d1_stemp_dx_0_i1m2p0k = -&
          0.5_wp*d1_stemp_dx_0_im11m2p0k+&
          0.5_wp*d1_stemp_dx_0_ip11m2p0k

d1_stemp_dx_0_i1m2p0k = d1_stemp_dx_0_i1m2p0k*param_float(1)

d1_stemp_dy_0_i1m2p0p0k = q(i,1-2+0+0,indvars(2))

d1_stemp_dy_0_i1m2p0p1k = q(i,1-2+0+1,indvars(2))

d1_stemp_dy_0_i1m2p0p2k = q(i,1-2+0+2,indvars(2))

d1_stemp_dy_0_i1m2p0k = -&
          1.5_wp*d1_stemp_dy_0_i1m2p0p0k+&
          2.0_wp*d1_stemp_dy_0_i1m2p0p1k-&
          0.5_wp*d1_stemp_dy_0_i1m2p0p2k

d1_stemp_dy_0_i1m2p0k = d1_stemp_dy_0_i1m2p0k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None 0 None stemp **************
!                                                           
!***********************************************************


qst(i,1-2+0,indvarsst(4)) =  (((0.5_wp*(qst(i,1-2+0,indvarsst(11))*(d1_stemp_dy_0_i1m2p0k)-&
                    qst(i,1-2+0,indvarsst(10))*(d1_stemp_dx_0_i1m2p0k)))**2+&
                    (0.5_wp*(qst(i,1-2+0,indvarsst(10))*(d1_stemp_dx_0_i1m2p0k)-&
                    qst(i,1-2+0,indvarsst(11))*(d1_stemp_dy_0_i1m2p0k)))**2)*2)**0.5

   enddo


!***********************************************************
!                                                           
! Start building layers for BC : None j1 None **************
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

d1_stemp_dx_0_im11m2p1k = q(i-1,1-2+1,indvars(3))

d1_stemp_dx_0_ip11m2p1k = q(i+1,1-2+1,indvars(3))

d1_stemp_dx_0_i1m2p1k = -&
          0.5_wp*d1_stemp_dx_0_im11m2p1k+&
          0.5_wp*d1_stemp_dx_0_ip11m2p1k

d1_stemp_dx_0_i1m2p1k = d1_stemp_dx_0_i1m2p1k*param_float(1)

d1_stemp_dy_0_i1m2p1m1k = q(i,1-2+1-1,indvars(2))

d1_stemp_dy_0_i1m2p1p1k = q(i,1-2+1+1,indvars(2))

d1_stemp_dy_0_i1m2p1k = -&
          0.5_wp*d1_stemp_dy_0_i1m2p1m1k+&
          0.5_wp*d1_stemp_dy_0_i1m2p1p1k

d1_stemp_dy_0_i1m2p1k = d1_stemp_dy_0_i1m2p1k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None 1 None stemp **************
!                                                           
!***********************************************************


qst(i,1-2+1,indvarsst(4)) =  (((0.5_wp*(qst(i,1-2+1,indvarsst(11))*(d1_stemp_dy_0_i1m2p1k)-&
                    qst(i,1-2+1,indvarsst(10))*(d1_stemp_dx_0_i1m2p1k)))**2+&
                    (0.5_wp*(qst(i,1-2+1,indvarsst(10))*(d1_stemp_dx_0_i1m2p1k)-&
                    qst(i,1-2+1,indvarsst(11))*(d1_stemp_dy_0_i1m2p1k)))**2)*2)**0.5

   enddo
