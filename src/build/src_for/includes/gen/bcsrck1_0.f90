














!====================================================================================================
!
! General Boundary Conditions: compute Eqns with Boundary Scheme
!     
!====================================================================================================

subroutine boundaryScheme_faces_k1_0(param_float,hlo,ind,idarray,neq,neqst,nx,ny,nz,sizeblck,q,qst,rhs,nvar_f,nvar_e,qface_i,qface_j,qface_k,qedge_ij,qedge_jk,qedge_ik)

  implicit none

integer,parameter :: wp = kind(0.0D0) ! working precision

!=======================================
!
! Addresses for integers parameters
!
!=======================================



!========================================
!
! Addresses for floating point parameters
!
!========================================


  real(wp), intent(in)    :: param_float(*)

  integer, intent(in) :: neq,neqst
  integer, intent(in) :: nx,ny,nz,hlo
  integer, intent(in) :: ind(1:neq+neqst) 
  integer, intent(in) :: idarray(6)
  integer, intent(in) :: sizeblck(3)
  integer, intent(in) :: nvar_f(3),nvar_e(3)
  
real(wp),intent(inout) :: q(idarray(1):idarray(2),idarray(3):idarray(4),neq),&
                        rhs(idarray(1):idarray(2),idarray(3):idarray(4),neq),&
                        qst(idarray(1):idarray(2),idarray(3):idarray(4),neqst)

real(wp),intent(inout) :: qface_i(1),&
                       qface_j(idarray(1):idarray(2),nvar_f(2)),&
                       qface_k(1),&
                       qedge_ij(1),&
                       qedge_jk(1),&
                       qedge_ik(1)

! LOCAL VARIABLES
 
  integer :: i,j,k
  integer :: bi,bj,bk
  integer :: biend,bjend,bkend
  integer :: size_bi,size_bj,size_bk
  integer :: indbc(6),idloop(6)



 real(wp) ::  d1_conv_rho_dx_0_im1j1m2,d1_conv_rho_dx_0_ip0j1m2,d1_conv_rho_dx_0_ip1j1m2 &
            ,d1_conv_rho_dx_0_ij1m2 &
            ,d1_conv_rho_dy_0_ijm11m2,d1_conv_rho_dy_0_ijp01m2,d1_conv_rho_dy_0_ijp11m2 &
            ,d1_conv_rho_dy_0_ij1m2 &
            ,d1_conv_rhou_dx_0_im1j1m2,d1_conv_rhou_dx_0_ip0j1m2,d1_conv_rhou_dx_0_ip1j1m2 &
            ,d1_conv_rhou_dx_0_ij1m2 &
            ,d1_conv_rhou_dy_0_ijm11m2,d1_conv_rhou_dy_0_ijp01m2,d1_conv_rhou_dy_0_ijp11m2 &
            ,d1_conv_rhou_dy_0_ij1m2 &
            ,d1_conv_rhov_dx_0_im1j1m2,d1_conv_rhov_dx_0_ip0j1m2,d1_conv_rhov_dx_0_ip1j1m2 &
            ,d1_conv_rhov_dx_0_ij1m2 &
            ,d1_conv_rhov_dy_0_ijm11m2,d1_conv_rhov_dy_0_ijp01m2,d1_conv_rhov_dy_0_ijp11m2 &
            ,d1_conv_rhov_dy_0_ij1m2 &
            ,d1_conv_et_dx_0_im1j1m2,d1_conv_et_dx_0_ip0j1m2,d1_conv_et_dx_0_ip1j1m2 &
            ,d1_conv_et_dx_0_ij1m2 &
            ,d1_conv_et_dy_0_ijm11m2,d1_conv_et_dy_0_ijp01m2,d1_conv_et_dy_0_ijp11m2 &
            ,d1_conv_et_dy_0_ij1m2 

 real(wp) ::  d2_dif_rhou_dxdx_0_0_im1j1m2_im1m1j1m2,d2_dif_rhou_dxdx_0_0_im1j1m2_im1p0j1m2,d2_dif_rhou_dxdx_0_0_im1j1m2_im1p1j1m2 &
            ,d2_dif_rhou_dxdx_0_0_im1j1m2 &
            ,d2_dif_rhou_dxdx_0_0_ip1j1m2_ip1m1j1m2,d2_dif_rhou_dxdx_0_0_ip1j1m2_ip1p0j1m2,d2_dif_rhou_dxdx_0_0_ip1j1m2_ip1p1j1m2 &
            ,d2_dif_rhou_dxdx_0_0_ip1j1m2 &
            ,d2_dif_rhou_dxdy_0_0_im1j1m2_im1jm11m2,d2_dif_rhou_dxdy_0_0_im1j1m2_im1jp01m2,d2_dif_rhou_dxdy_0_0_im1j1m2_im1jp11m2 &
            ,d2_dif_rhou_dxdy_0_0_im1j1m2 &
            ,d2_dif_rhou_dxdy_0_0_ip1j1m2_ip1jm11m2,d2_dif_rhou_dxdy_0_0_ip1j1m2_ip1jp01m2,d2_dif_rhou_dxdy_0_0_ip1j1m2_ip1jp11m2 &
            ,d2_dif_rhou_dxdy_0_0_ip1j1m2 &
            ,d1_dif_rhou_dx_0_im1j1m2,d1_dif_rhou_dx_0_ip0j1m2,d1_dif_rhou_dx_0_ip1j1m2 &
            ,d1_dif_rhou_dx_0_ij1m2 &
            ,d2_dif_rhou_dydx_0_0_ijm11m2_im1jm11m2,d2_dif_rhou_dydx_0_0_ijm11m2_ip0jm11m2,d2_dif_rhou_dydx_0_0_ijm11m2_ip1jm11m2 &
            ,d2_dif_rhou_dydx_0_0_ijm11m2 &
            ,d2_dif_rhou_dydx_0_0_ijp11m2_im1jp11m2,d2_dif_rhou_dydx_0_0_ijp11m2_ip0jp11m2,d2_dif_rhou_dydx_0_0_ijp11m2_ip1jp11m2 &
            ,d2_dif_rhou_dydx_0_0_ijp11m2 &
            ,d2_dif_rhou_dydy_0_0_ijm11m2_ijm1m11m2,d2_dif_rhou_dydy_0_0_ijm11m2_ijm1p01m2,d2_dif_rhou_dydy_0_0_ijm11m2_ijm1p11m2 &
            ,d2_dif_rhou_dydy_0_0_ijm11m2 &
            ,d2_dif_rhou_dydy_0_0_ijp11m2_ijp1m11m2,d2_dif_rhou_dydy_0_0_ijp11m2_ijp1p01m2,d2_dif_rhou_dydy_0_0_ijp11m2_ijp1p11m2 &
            ,d2_dif_rhou_dydy_0_0_ijp11m2 &
            ,d1_dif_rhou_dy_0_ijm11m2,d1_dif_rhou_dy_0_ijp01m2,d1_dif_rhou_dy_0_ijp11m2 &
            ,d1_dif_rhou_dy_0_ij1m2 &
            ,d2_dif_rhov_dxdx_0_0_im1j1m2_im1m1j1m2,d2_dif_rhov_dxdx_0_0_im1j1m2_im1p0j1m2,d2_dif_rhov_dxdx_0_0_im1j1m2_im1p1j1m2 &
            ,d2_dif_rhov_dxdx_0_0_im1j1m2 &
            ,d2_dif_rhov_dxdx_0_0_ip1j1m2_ip1m1j1m2,d2_dif_rhov_dxdx_0_0_ip1j1m2_ip1p0j1m2,d2_dif_rhov_dxdx_0_0_ip1j1m2_ip1p1j1m2 &
            ,d2_dif_rhov_dxdx_0_0_ip1j1m2 &
            ,d2_dif_rhov_dxdy_0_0_im1j1m2_im1jm11m2,d2_dif_rhov_dxdy_0_0_im1j1m2_im1jp01m2,d2_dif_rhov_dxdy_0_0_im1j1m2_im1jp11m2 &
            ,d2_dif_rhov_dxdy_0_0_im1j1m2 &
            ,d2_dif_rhov_dxdy_0_0_ip1j1m2_ip1jm11m2,d2_dif_rhov_dxdy_0_0_ip1j1m2_ip1jp01m2,d2_dif_rhov_dxdy_0_0_ip1j1m2_ip1jp11m2 &
            ,d2_dif_rhov_dxdy_0_0_ip1j1m2 &
            ,d1_dif_rhov_dx_0_im1j1m2,d1_dif_rhov_dx_0_ip0j1m2,d1_dif_rhov_dx_0_ip1j1m2 &
            ,d1_dif_rhov_dx_0_ij1m2 &
            ,d2_dif_rhov_dydx_0_0_ijm11m2_im1jm11m2,d2_dif_rhov_dydx_0_0_ijm11m2_ip0jm11m2,d2_dif_rhov_dydx_0_0_ijm11m2_ip1jm11m2 &
            ,d2_dif_rhov_dydx_0_0_ijm11m2 &
            ,d2_dif_rhov_dydx_0_0_ijp11m2_im1jp11m2,d2_dif_rhov_dydx_0_0_ijp11m2_ip0jp11m2,d2_dif_rhov_dydx_0_0_ijp11m2_ip1jp11m2 &
            ,d2_dif_rhov_dydx_0_0_ijp11m2 &
            ,d2_dif_rhov_dydy_0_0_ijm11m2_ijm1m11m2,d2_dif_rhov_dydy_0_0_ijm11m2_ijm1p01m2,d2_dif_rhov_dydy_0_0_ijm11m2_ijm1p11m2 &
            ,d2_dif_rhov_dydy_0_0_ijm11m2 &
            ,d2_dif_rhov_dydy_0_0_ijp11m2_ijp1m11m2,d2_dif_rhov_dydy_0_0_ijp11m2_ijp1p01m2,d2_dif_rhov_dydy_0_0_ijp11m2_ijp1p11m2 &
            ,d2_dif_rhov_dydy_0_0_ijp11m2 &
            ,d1_dif_rhov_dy_0_ijm11m2,d1_dif_rhov_dy_0_ijp01m2,d1_dif_rhov_dy_0_ijp11m2 &
            ,d1_dif_rhov_dy_0_ij1m2 &
            ,d2_dif_et_dxdx_0_0_im1j1m2_im1m1j1m2,d2_dif_et_dxdx_0_0_im1j1m2_im1p0j1m2,d2_dif_et_dxdx_0_0_im1j1m2_im1p1j1m2 &
            ,d2_dif_et_dxdx_0_0_im1j1m2 &
            ,d2_dif_et_dxdx_0_0_ip1j1m2_ip1m1j1m2,d2_dif_et_dxdx_0_0_ip1j1m2_ip1p0j1m2,d2_dif_et_dxdx_0_0_ip1j1m2_ip1p1j1m2 &
            ,d2_dif_et_dxdx_0_0_ip1j1m2 &
            ,d1_dif_et_dx_0_im1j1m2,d1_dif_et_dx_0_ip0j1m2,d1_dif_et_dx_0_ip1j1m2 &
            ,d1_dif_et_dx_0_ij1m2 &
            ,d2_dif_et_dydy_0_0_ijm11m2_ijm1m11m2,d2_dif_et_dydy_0_0_ijm11m2_ijm1p01m2,d2_dif_et_dydy_0_0_ijm11m2_ijm1p11m2 &
            ,d2_dif_et_dydy_0_0_ijm11m2 &
            ,d2_dif_et_dydy_0_0_ijp11m2_ijp1m11m2,d2_dif_et_dydy_0_0_ijp11m2_ijp1p01m2,d2_dif_et_dydy_0_0_ijp11m2_ijp1p11m2 &
            ,d2_dif_et_dydy_0_0_ijp11m2 &
            ,d1_dif_et_dy_0_ijm11m2,d1_dif_et_dy_0_ijp01m2,d1_dif_et_dy_0_ijp11m2 &
            ,d1_dif_et_dy_0_ij1m2 

  integer :: indvars(neq),indvarsst(neqst)


  indvars   = ind(1:neq)
  indvarsst = ind(1+neq:neq+neqst) 

!f2py intent(in)    :: qst,nx,ny,nz
!f2py intent(inout) :: q,rhs
      
size_bk = sizeblck(3)
size_bj = sizeblck(2)
size_bi = sizeblck(1)

indbc(1)=1
indbc(2)=1

indbc(3)=1
indbc(4)=1

indbc(5)=1
indbc(6)=1


!$OMP DO SCHEDULE(GUIDED,4) COLLAPSE(2)  
  do bk=indbc(5),indbc(6),size_bk  
    do bj=indbc(3),indbc(4),size_bj 
      do bi=indbc(1),indbc(2),size_bi 
    
   
idloop(6) = min( bk+size_bk, indbc(6)+1)-1
idloop(4) = min( bj+size_bj, indbc(4)+1)-1
idloop(2) = min( bi+size_bi, indbc(2)+1)-1

idloop(5) = bk
idloop(3) = bj
idloop(1) = bi 



!***********************************************************
!                                                           
! Start building layers for BC : None None k1 **************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: None None 0 ************************************
!                                                           
!***********************************************************


     do j=idloop(3),idloop(4) 
 
      do i=idloop(1),idloop(2) 


!***********************************************************
!                                                           
! building source terms in RHS for layer None None 0 d(rho)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([rho*u]_1x)+deltayI*([rho*v]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_conv_rho_dx_0_im1j1m2 = q(i-1,j,indvars(1))*q(i-1,j,indvars(2))

d1_conv_rho_dx_0_ip1j1m2 = q(i+1,j,indvars(1))*q(i+1,j,indvars(2))

d1_conv_rho_dx_0_ij1m2 = -&
          0.5_wp*d1_conv_rho_dx_0_im1j1m2+&
          0.5_wp*d1_conv_rho_dx_0_ip1j1m2

d1_conv_rho_dx_0_ij1m2 = d1_conv_rho_dx_0_ij1m2*param_float(1)

d1_conv_rho_dy_0_ijm11m2 = q(i,j-1,indvars(1))*q(i,j-1,indvars(3))

d1_conv_rho_dy_0_ijp11m2 = q(i,j+1,indvars(1))*q(i,j+1,indvars(3))

d1_conv_rho_dy_0_ij1m2 = -&
          0.5_wp*d1_conv_rho_dy_0_ijm11m2+&
          0.5_wp*d1_conv_rho_dy_0_ijp11m2

d1_conv_rho_dy_0_ij1m2 = d1_conv_rho_dy_0_ij1m2*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None None 0 d(rho)/dt **********
!                                                           
!***********************************************************


rhs(i,j,indvars(1)) =   -  ( qst(i,j,indvarsst(10))*(d1_conv_rho_dx_0_ij1m2)+&
                    qst(i,j,indvarsst(11))*(d1_conv_rho_dy_0_ij1m2) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer None None 0 d(rho u)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([rho*u*u+p]_1x)+deltayI*([rho*v*u]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_conv_rhou_dx_0_im1j1m2 = q(i-1,j,indvars(1))*q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+(param_float(3 + 5))*q(i-1,j,indvars(1))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))

d1_conv_rhou_dx_0_ip1j1m2 = q(i+1,j,indvars(1))*q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+(param_float(3 + 5))*q(i+1,j,indvars(1))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))

d1_conv_rhou_dx_0_ij1m2 = -&
          0.5_wp*d1_conv_rhou_dx_0_im1j1m2+&
          0.5_wp*d1_conv_rhou_dx_0_ip1j1m2

d1_conv_rhou_dx_0_ij1m2 = d1_conv_rhou_dx_0_ij1m2*param_float(1)

d1_conv_rhou_dy_0_ijm11m2 = q(i,j-1,indvars(1))*q(i,j-1,indvars(3))*q(i,j-1,indvars(2))

d1_conv_rhou_dy_0_ijp11m2 = q(i,j+1,indvars(1))*q(i,j+1,indvars(3))*q(i,j+1,indvars(2))

d1_conv_rhou_dy_0_ij1m2 = -&
          0.5_wp*d1_conv_rhou_dy_0_ijm11m2+&
          0.5_wp*d1_conv_rhou_dy_0_ijp11m2

d1_conv_rhou_dy_0_ij1m2 = d1_conv_rhou_dy_0_ij1m2*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None None 0 d(rho u)/dt ********
!                                                           
!***********************************************************


rhs(i,j,indvars(2)) =   -  ( qst(i,j,indvarsst(10))*(d1_conv_rhou_dx_0_ij1m2)+&
                    qst(i,j,indvarsst(11))*(d1_conv_rhou_dy_0_ij1m2) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer None None 0 d(rho v)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([rho*u*v]_1x)+deltayI*([rho*v*v+p]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_conv_rhov_dx_0_im1j1m2 = q(i-1,j,indvars(1))*q(i-1,j,indvars(2))*q(i-1,j,indvars(3))

d1_conv_rhov_dx_0_ip1j1m2 = q(i+1,j,indvars(1))*q(i+1,j,indvars(2))*q(i+1,j,indvars(3))

d1_conv_rhov_dx_0_ij1m2 = -&
          0.5_wp*d1_conv_rhov_dx_0_im1j1m2+&
          0.5_wp*d1_conv_rhov_dx_0_ip1j1m2

d1_conv_rhov_dx_0_ij1m2 = d1_conv_rhov_dx_0_ij1m2*param_float(1)

d1_conv_rhov_dy_0_ijm11m2 = q(i,j-1,indvars(1))*q(i,j-1,indvars(3))*q(i,j-1,indvars(3))+(param_float(3 + 5))*q(i,j-1,indvars(1))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))

d1_conv_rhov_dy_0_ijp11m2 = q(i,j+1,indvars(1))*q(i,j+1,indvars(3))*q(i,j+1,indvars(3))+(param_float(3 + 5))*q(i,j+1,indvars(1))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))

d1_conv_rhov_dy_0_ij1m2 = -&
          0.5_wp*d1_conv_rhov_dy_0_ijm11m2+&
          0.5_wp*d1_conv_rhov_dy_0_ijp11m2

d1_conv_rhov_dy_0_ij1m2 = d1_conv_rhov_dy_0_ij1m2*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None None 0 d(rho v)/dt ********
!                                                           
!***********************************************************


rhs(i,j,indvars(3)) =   -  ( qst(i,j,indvarsst(10))*(d1_conv_rhov_dx_0_ij1m2)+&
                    qst(i,j,indvarsst(11))*(d1_conv_rhov_dy_0_ij1m2) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer None None 0 d(rho et)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([(rho*et+p)*u]_1x)+deltayI*([(rho*et+p)*v]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_conv_et_dx_0_im1j1m2 = (q(i-1,j,indvars(1))*q(i-1,j,indvars(4))+&
                    (param_float(3 + 5))*q(i-1,j,indvars(1))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3))))))*q(i-1,j,indvars(2))

d1_conv_et_dx_0_ip1j1m2 = (q(i+1,j,indvars(1))*q(i+1,j,indvars(4))+&
                    (param_float(3 + 5))*q(i+1,j,indvars(1))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3))))))*q(i+1,j,indvars(2))

d1_conv_et_dx_0_ij1m2 = -&
          0.5_wp*d1_conv_et_dx_0_im1j1m2+&
          0.5_wp*d1_conv_et_dx_0_ip1j1m2

d1_conv_et_dx_0_ij1m2 = d1_conv_et_dx_0_ij1m2*param_float(1)

d1_conv_et_dy_0_ijm11m2 = (q(i,j-1,indvars(1))*q(i,j-1,indvars(4))+&
                    (param_float(3 + 5))*q(i,j-1,indvars(1))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3))))))*q(i,j-1,indvars(3))

d1_conv_et_dy_0_ijp11m2 = (q(i,j+1,indvars(1))*q(i,j+1,indvars(4))+&
                    (param_float(3 + 5))*q(i,j+1,indvars(1))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3))))))*q(i,j+1,indvars(3))

d1_conv_et_dy_0_ij1m2 = -&
          0.5_wp*d1_conv_et_dy_0_ijm11m2+&
          0.5_wp*d1_conv_et_dy_0_ijp11m2

d1_conv_et_dy_0_ij1m2 = d1_conv_et_dy_0_ij1m2*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None None 0 d(rho et)/dt *******
!                                                           
!***********************************************************


rhs(i,j,indvars(4)) =   -  ( qst(i,j,indvarsst(10))*(d1_conv_et_dx_0_ij1m2)+&
                    qst(i,j,indvarsst(11))*(d1_conv_et_dy_0_ij1m2) ) 

     enddo
   enddo


!***********************************************************
!                                                           
! Start building layers for BC : None None k1 **************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: None None 0 ************************************
!                                                           
!***********************************************************


     do j=idloop(3),idloop(4) 
 
      do i=idloop(1),idloop(2) 


!***********************************************************
!                                                           
! building source terms in RHS for layer None None 0 d(rho u)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([-visc_t*(2.0_wp*deltaxI*({u}_1x)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y)))]_1x)+deltayI*([-visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_dif_rhou_dxdx_0_0_im1j1m2_im1m1j1m2 = q(i-1-1,j,indvars(2))

d2_dif_rhou_dxdx_0_0_im1j1m2_im1p1j1m2 = q(i-1+1,j,indvars(2))

d2_dif_rhou_dxdx_0_0_im1j1m2 = -&
          0.5_wp*d2_dif_rhou_dxdx_0_0_im1j1m2_im1m1j1m2+&
          0.5_wp*d2_dif_rhou_dxdx_0_0_im1j1m2_im1p1j1m2

d2_dif_rhou_dxdx_0_0_im1j1m2 = d2_dif_rhou_dxdx_0_0_im1j1m2*param_float(1)

d2_dif_rhou_dxdx_0_0_ip1j1m2_ip1m1j1m2 = q(i+1-1,j,indvars(2))

d2_dif_rhou_dxdx_0_0_ip1j1m2_ip1p1j1m2 = q(i+1+1,j,indvars(2))

d2_dif_rhou_dxdx_0_0_ip1j1m2 = -&
          0.5_wp*d2_dif_rhou_dxdx_0_0_ip1j1m2_ip1m1j1m2+&
          0.5_wp*d2_dif_rhou_dxdx_0_0_ip1j1m2_ip1p1j1m2

d2_dif_rhou_dxdx_0_0_ip1j1m2 = d2_dif_rhou_dxdx_0_0_ip1j1m2*param_float(1)

d2_dif_rhou_dxdy_0_0_im1j1m2_im1jm11m2 = q(i-1,j-1,indvars(3))

d2_dif_rhou_dxdy_0_0_im1j1m2_im1jp11m2 = q(i-1,j+1,indvars(3))

d2_dif_rhou_dxdy_0_0_im1j1m2 = -&
          0.5_wp*d2_dif_rhou_dxdy_0_0_im1j1m2_im1jm11m2+&
          0.5_wp*d2_dif_rhou_dxdy_0_0_im1j1m2_im1jp11m2

d2_dif_rhou_dxdy_0_0_im1j1m2 = d2_dif_rhou_dxdy_0_0_im1j1m2*param_float(2)

d2_dif_rhou_dxdy_0_0_ip1j1m2_ip1jm11m2 = q(i+1,j-1,indvars(3))

d2_dif_rhou_dxdy_0_0_ip1j1m2_ip1jp11m2 = q(i+1,j+1,indvars(3))

d2_dif_rhou_dxdy_0_0_ip1j1m2 = -&
          0.5_wp*d2_dif_rhou_dxdy_0_0_ip1j1m2_ip1jm11m2+&
          0.5_wp*d2_dif_rhou_dxdy_0_0_ip1j1m2_ip1jp11m2

d2_dif_rhou_dxdy_0_0_ip1j1m2 = d2_dif_rhou_dxdy_0_0_ip1j1m2*param_float(2)

d1_dif_rhou_dx_0_im1j1m2 = -((1+&
                    param_float(21 + 5))/(((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i-1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_im1j1m2)-&
                    2.0_wp/3.0_wp*(qst(i-1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_im1j1m2)+&
                    qst(i-1,j,indvarsst(11))*(d2_dif_rhou_dxdy_0_0_im1j1m2)))

d1_dif_rhou_dx_0_ip1j1m2 = -((1+&
                    param_float(21 + 5))/(((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i+1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_ip1j1m2)-&
                    2.0_wp/3.0_wp*(qst(i+1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_ip1j1m2)+&
                    qst(i+1,j,indvarsst(11))*(d2_dif_rhou_dxdy_0_0_ip1j1m2)))

d1_dif_rhou_dx_0_ij1m2 = -&
          0.5_wp*d1_dif_rhou_dx_0_im1j1m2+&
          0.5_wp*d1_dif_rhou_dx_0_ip1j1m2

d1_dif_rhou_dx_0_ij1m2 = d1_dif_rhou_dx_0_ij1m2*param_float(1)

d2_dif_rhou_dydx_0_0_ijm11m2_im1jm11m2 = q(i-1,j-1,indvars(3))

d2_dif_rhou_dydx_0_0_ijm11m2_ip1jm11m2 = q(i+1,j-1,indvars(3))

d2_dif_rhou_dydx_0_0_ijm11m2 = -&
          0.5_wp*d2_dif_rhou_dydx_0_0_ijm11m2_im1jm11m2+&
          0.5_wp*d2_dif_rhou_dydx_0_0_ijm11m2_ip1jm11m2

d2_dif_rhou_dydx_0_0_ijm11m2 = d2_dif_rhou_dydx_0_0_ijm11m2*param_float(1)

d2_dif_rhou_dydx_0_0_ijp11m2_im1jp11m2 = q(i-1,j+1,indvars(3))

d2_dif_rhou_dydx_0_0_ijp11m2_ip1jp11m2 = q(i+1,j+1,indvars(3))

d2_dif_rhou_dydx_0_0_ijp11m2 = -&
          0.5_wp*d2_dif_rhou_dydx_0_0_ijp11m2_im1jp11m2+&
          0.5_wp*d2_dif_rhou_dydx_0_0_ijp11m2_ip1jp11m2

d2_dif_rhou_dydx_0_0_ijp11m2 = d2_dif_rhou_dydx_0_0_ijp11m2*param_float(1)

d2_dif_rhou_dydy_0_0_ijm11m2_ijm1m11m2 = q(i,j-1-1,indvars(2))

d2_dif_rhou_dydy_0_0_ijm11m2_ijm1p11m2 = q(i,j-1+1,indvars(2))

d2_dif_rhou_dydy_0_0_ijm11m2 = -&
          0.5_wp*d2_dif_rhou_dydy_0_0_ijm11m2_ijm1m11m2+&
          0.5_wp*d2_dif_rhou_dydy_0_0_ijm11m2_ijm1p11m2

d2_dif_rhou_dydy_0_0_ijm11m2 = d2_dif_rhou_dydy_0_0_ijm11m2*param_float(2)

d2_dif_rhou_dydy_0_0_ijp11m2_ijp1m11m2 = q(i,j+1-1,indvars(2))

d2_dif_rhou_dydy_0_0_ijp11m2_ijp1p11m2 = q(i,j+1+1,indvars(2))

d2_dif_rhou_dydy_0_0_ijp11m2 = -&
          0.5_wp*d2_dif_rhou_dydy_0_0_ijp11m2_ijp1m11m2+&
          0.5_wp*d2_dif_rhou_dydy_0_0_ijp11m2_ijp1p11m2

d2_dif_rhou_dydy_0_0_ijp11m2 = d2_dif_rhou_dydy_0_0_ijp11m2*param_float(2)

d1_dif_rhou_dy_0_ijm11m2 = -((1+&
                    param_float(21 + 5))/(((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i,j-1,indvarsst(11))*(d2_dif_rhou_dydy_0_0_ijm11m2)+&
                    qst(i,j-1,indvarsst(10))*(d2_dif_rhou_dydx_0_0_ijm11m2))

d1_dif_rhou_dy_0_ijp11m2 = -((1+&
                    param_float(21 + 5))/(((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i,j+1,indvarsst(11))*(d2_dif_rhou_dydy_0_0_ijp11m2)+&
                    qst(i,j+1,indvarsst(10))*(d2_dif_rhou_dydx_0_0_ijp11m2))

d1_dif_rhou_dy_0_ij1m2 = -&
          0.5_wp*d1_dif_rhou_dy_0_ijm11m2+&
          0.5_wp*d1_dif_rhou_dy_0_ijp11m2

d1_dif_rhou_dy_0_ij1m2 = d1_dif_rhou_dy_0_ij1m2*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None None 0 d(rho u)/dt ********
!                                                           
!***********************************************************


rhs(i,j,indvars(2)) = rhs(i,j,indvars(2))  -  ( qst(i,j,indvarsst(10))*(d1_dif_rhou_dx_0_ij1m2)+&
                    qst(i,j,indvarsst(11))*(d1_dif_rhou_dy_0_ij1m2) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer None None 0 d(rho v)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([-visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x))]_1x)+deltayI*([-visc_t*(2.0_wp*deltayI*({v}_1y)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y)))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_dif_rhov_dxdx_0_0_im1j1m2_im1m1j1m2 = q(i-1-1,j,indvars(3))

d2_dif_rhov_dxdx_0_0_im1j1m2_im1p1j1m2 = q(i-1+1,j,indvars(3))

d2_dif_rhov_dxdx_0_0_im1j1m2 = -&
          0.5_wp*d2_dif_rhov_dxdx_0_0_im1j1m2_im1m1j1m2+&
          0.5_wp*d2_dif_rhov_dxdx_0_0_im1j1m2_im1p1j1m2

d2_dif_rhov_dxdx_0_0_im1j1m2 = d2_dif_rhov_dxdx_0_0_im1j1m2*param_float(1)

d2_dif_rhov_dxdx_0_0_ip1j1m2_ip1m1j1m2 = q(i+1-1,j,indvars(3))

d2_dif_rhov_dxdx_0_0_ip1j1m2_ip1p1j1m2 = q(i+1+1,j,indvars(3))

d2_dif_rhov_dxdx_0_0_ip1j1m2 = -&
          0.5_wp*d2_dif_rhov_dxdx_0_0_ip1j1m2_ip1m1j1m2+&
          0.5_wp*d2_dif_rhov_dxdx_0_0_ip1j1m2_ip1p1j1m2

d2_dif_rhov_dxdx_0_0_ip1j1m2 = d2_dif_rhov_dxdx_0_0_ip1j1m2*param_float(1)

d2_dif_rhov_dxdy_0_0_im1j1m2_im1jm11m2 = q(i-1,j-1,indvars(2))

d2_dif_rhov_dxdy_0_0_im1j1m2_im1jp11m2 = q(i-1,j+1,indvars(2))

d2_dif_rhov_dxdy_0_0_im1j1m2 = -&
          0.5_wp*d2_dif_rhov_dxdy_0_0_im1j1m2_im1jm11m2+&
          0.5_wp*d2_dif_rhov_dxdy_0_0_im1j1m2_im1jp11m2

d2_dif_rhov_dxdy_0_0_im1j1m2 = d2_dif_rhov_dxdy_0_0_im1j1m2*param_float(2)

d2_dif_rhov_dxdy_0_0_ip1j1m2_ip1jm11m2 = q(i+1,j-1,indvars(2))

d2_dif_rhov_dxdy_0_0_ip1j1m2_ip1jp11m2 = q(i+1,j+1,indvars(2))

d2_dif_rhov_dxdy_0_0_ip1j1m2 = -&
          0.5_wp*d2_dif_rhov_dxdy_0_0_ip1j1m2_ip1jm11m2+&
          0.5_wp*d2_dif_rhov_dxdy_0_0_ip1j1m2_ip1jp11m2

d2_dif_rhov_dxdy_0_0_ip1j1m2 = d2_dif_rhov_dxdy_0_0_ip1j1m2*param_float(2)

d1_dif_rhov_dx_0_im1j1m2 = -((1+&
                    param_float(21 + 5))/(((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i-1,j,indvarsst(11))*(d2_dif_rhov_dxdy_0_0_im1j1m2)+&
                    qst(i-1,j,indvarsst(10))*(d2_dif_rhov_dxdx_0_0_im1j1m2))

d1_dif_rhov_dx_0_ip1j1m2 = -((1+&
                    param_float(21 + 5))/(((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i+1,j,indvarsst(11))*(d2_dif_rhov_dxdy_0_0_ip1j1m2)+&
                    qst(i+1,j,indvarsst(10))*(d2_dif_rhov_dxdx_0_0_ip1j1m2))

d1_dif_rhov_dx_0_ij1m2 = -&
          0.5_wp*d1_dif_rhov_dx_0_im1j1m2+&
          0.5_wp*d1_dif_rhov_dx_0_ip1j1m2

d1_dif_rhov_dx_0_ij1m2 = d1_dif_rhov_dx_0_ij1m2*param_float(1)

d2_dif_rhov_dydx_0_0_ijm11m2_im1jm11m2 = q(i-1,j-1,indvars(2))

d2_dif_rhov_dydx_0_0_ijm11m2_ip1jm11m2 = q(i+1,j-1,indvars(2))

d2_dif_rhov_dydx_0_0_ijm11m2 = -&
          0.5_wp*d2_dif_rhov_dydx_0_0_ijm11m2_im1jm11m2+&
          0.5_wp*d2_dif_rhov_dydx_0_0_ijm11m2_ip1jm11m2

d2_dif_rhov_dydx_0_0_ijm11m2 = d2_dif_rhov_dydx_0_0_ijm11m2*param_float(1)

d2_dif_rhov_dydx_0_0_ijp11m2_im1jp11m2 = q(i-1,j+1,indvars(2))

d2_dif_rhov_dydx_0_0_ijp11m2_ip1jp11m2 = q(i+1,j+1,indvars(2))

d2_dif_rhov_dydx_0_0_ijp11m2 = -&
          0.5_wp*d2_dif_rhov_dydx_0_0_ijp11m2_im1jp11m2+&
          0.5_wp*d2_dif_rhov_dydx_0_0_ijp11m2_ip1jp11m2

d2_dif_rhov_dydx_0_0_ijp11m2 = d2_dif_rhov_dydx_0_0_ijp11m2*param_float(1)

d2_dif_rhov_dydy_0_0_ijm11m2_ijm1m11m2 = q(i,j-1-1,indvars(3))

d2_dif_rhov_dydy_0_0_ijm11m2_ijm1p11m2 = q(i,j-1+1,indvars(3))

d2_dif_rhov_dydy_0_0_ijm11m2 = -&
          0.5_wp*d2_dif_rhov_dydy_0_0_ijm11m2_ijm1m11m2+&
          0.5_wp*d2_dif_rhov_dydy_0_0_ijm11m2_ijm1p11m2

d2_dif_rhov_dydy_0_0_ijm11m2 = d2_dif_rhov_dydy_0_0_ijm11m2*param_float(2)

d2_dif_rhov_dydy_0_0_ijp11m2_ijp1m11m2 = q(i,j+1-1,indvars(3))

d2_dif_rhov_dydy_0_0_ijp11m2_ijp1p11m2 = q(i,j+1+1,indvars(3))

d2_dif_rhov_dydy_0_0_ijp11m2 = -&
          0.5_wp*d2_dif_rhov_dydy_0_0_ijp11m2_ijp1m11m2+&
          0.5_wp*d2_dif_rhov_dydy_0_0_ijp11m2_ijp1p11m2

d2_dif_rhov_dydy_0_0_ijp11m2 = d2_dif_rhov_dydy_0_0_ijp11m2*param_float(2)

d1_dif_rhov_dy_0_ijm11m2 = -((1+&
                    param_float(21 + 5))/(((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i,j-1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijm11m2)-&
                    2.0_wp/3.0_wp*(qst(i,j-1,indvarsst(10))*(d2_dif_rhov_dydx_0_0_ijm11m2)+&
                    qst(i,j-1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijm11m2)))

d1_dif_rhov_dy_0_ijp11m2 = -((1+&
                    param_float(21 + 5))/(((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i,j+1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijp11m2)-&
                    2.0_wp/3.0_wp*(qst(i,j+1,indvarsst(10))*(d2_dif_rhov_dydx_0_0_ijp11m2)+&
                    qst(i,j+1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijp11m2)))

d1_dif_rhov_dy_0_ij1m2 = -&
          0.5_wp*d1_dif_rhov_dy_0_ijm11m2+&
          0.5_wp*d1_dif_rhov_dy_0_ijp11m2

d1_dif_rhov_dy_0_ij1m2 = d1_dif_rhov_dy_0_ij1m2*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None None 0 d(rho v)/dt ********
!                                                           
!***********************************************************


rhs(i,j,indvars(3)) = rhs(i,j,indvars(3))  -  ( qst(i,j,indvarsst(10))*(d1_dif_rhov_dx_0_ij1m2)+&
                    qst(i,j,indvarsst(11))*(d1_dif_rhov_dy_0_ij1m2) ) 



!***********************************************************
!                                                           
! building source terms in RHS for layer None None 0 d(rho et)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! deltaxI*([-kappa*deltaxI*({T}_1x)-u*(visc_t*(2.0_wp*deltaxI*({u}_1x)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y))))-v*(visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x)))]_1x)+deltayI*([-kappa*deltayI*({T}_1y)-u*(visc_t*(deltayI*({u}_1y)+deltaxI*({v}_1x)))-v*(visc_t*(2.0_wp*deltayI*({v}_1y)-2.0_wp/3.0_wp*(deltaxI*({u}_1x)+deltayI*({v}_1y))))]_1y)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d2_dif_et_dxdx_0_0_im1j1m2_im1m1j1m2 = ((q(i-1-1,j,indvars(4))-&
                    0.5_wp*(q(i-1-1,j,indvars(2))*q(i-1-1,j,indvars(2))+&
                    q(i-1-1,j,indvars(3))*q(i-1-1,j,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dxdx_0_0_im1j1m2_im1p1j1m2 = ((q(i-1+1,j,indvars(4))-&
                    0.5_wp*(q(i-1+1,j,indvars(2))*q(i-1+1,j,indvars(2))+&
                    q(i-1+1,j,indvars(3))*q(i-1+1,j,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dxdx_0_0_im1j1m2 = -&
          0.5_wp*d2_dif_et_dxdx_0_0_im1j1m2_im1m1j1m2+&
          0.5_wp*d2_dif_et_dxdx_0_0_im1j1m2_im1p1j1m2

d2_dif_et_dxdx_0_0_im1j1m2 = d2_dif_et_dxdx_0_0_im1j1m2*param_float(1)

d2_dif_et_dxdx_0_0_ip1j1m2_ip1m1j1m2 = ((q(i+1-1,j,indvars(4))-&
                    0.5_wp*(q(i+1-1,j,indvars(2))*q(i+1-1,j,indvars(2))+&
                    q(i+1-1,j,indvars(3))*q(i+1-1,j,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dxdx_0_0_ip1j1m2_ip1p1j1m2 = ((q(i+1+1,j,indvars(4))-&
                    0.5_wp*(q(i+1+1,j,indvars(2))*q(i+1+1,j,indvars(2))+&
                    q(i+1+1,j,indvars(3))*q(i+1+1,j,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dxdx_0_0_ip1j1m2 = -&
          0.5_wp*d2_dif_et_dxdx_0_0_ip1j1m2_ip1m1j1m2+&
          0.5_wp*d2_dif_et_dxdx_0_0_ip1j1m2_ip1p1j1m2

d2_dif_et_dxdx_0_0_ip1j1m2 = d2_dif_et_dxdx_0_0_ip1j1m2*param_float(1)

d1_dif_et_dx_0_im1j1m2 = -param_float(2 + 5)*qst(i-1,j,indvarsst(10))*(d2_dif_et_dxdx_0_0_im1j1m2)-&
                    q(i-1,j,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i-1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_im1j1m2)-&
                    2.0_wp/3.0_wp*(qst(i-1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_im1j1m2)+&
                    qst(i-1,j,indvarsst(11))*(d2_dif_rhou_dxdy_0_0_im1j1m2))))-&
                    q(i-1,j,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i-1,j,indvars(4))-&
                    0.5_wp*(q(i-1,j,indvars(2))*q(i-1,j,indvars(2))+&
                    q(i-1,j,indvars(3))*q(i-1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i-1,j,indvarsst(11))*(d2_dif_rhov_dxdy_0_0_im1j1m2)+&
                    qst(i-1,j,indvarsst(10))*(d2_dif_rhov_dxdx_0_0_im1j1m2)))

d1_dif_et_dx_0_ip1j1m2 = -param_float(2 + 5)*qst(i+1,j,indvarsst(10))*(d2_dif_et_dxdx_0_0_ip1j1m2)-&
                    q(i+1,j,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i+1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_ip1j1m2)-&
                    2.0_wp/3.0_wp*(qst(i+1,j,indvarsst(10))*(d2_dif_rhou_dxdx_0_0_ip1j1m2)+&
                    qst(i+1,j,indvarsst(11))*(d2_dif_rhou_dxdy_0_0_ip1j1m2))))-&
                    q(i+1,j,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i+1,j,indvars(4))-&
                    0.5_wp*(q(i+1,j,indvars(2))*q(i+1,j,indvars(2))+&
                    q(i+1,j,indvars(3))*q(i+1,j,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i+1,j,indvarsst(11))*(d2_dif_rhov_dxdy_0_0_ip1j1m2)+&
                    qst(i+1,j,indvarsst(10))*(d2_dif_rhov_dxdx_0_0_ip1j1m2)))

d1_dif_et_dx_0_ij1m2 = -&
          0.5_wp*d1_dif_et_dx_0_im1j1m2+&
          0.5_wp*d1_dif_et_dx_0_ip1j1m2

d1_dif_et_dx_0_ij1m2 = d1_dif_et_dx_0_ij1m2*param_float(1)

d2_dif_et_dydy_0_0_ijm11m2_ijm1m11m2 = ((q(i,j-1-1,indvars(4))-&
                    0.5_wp*(q(i,j-1-1,indvars(2))*q(i,j-1-1,indvars(2))+&
                    q(i,j-1-1,indvars(3))*q(i,j-1-1,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dydy_0_0_ijm11m2_ijm1p11m2 = ((q(i,j-1+1,indvars(4))-&
                    0.5_wp*(q(i,j-1+1,indvars(2))*q(i,j-1+1,indvars(2))+&
                    q(i,j-1+1,indvars(3))*q(i,j-1+1,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dydy_0_0_ijm11m2 = -&
          0.5_wp*d2_dif_et_dydy_0_0_ijm11m2_ijm1m11m2+&
          0.5_wp*d2_dif_et_dydy_0_0_ijm11m2_ijm1p11m2

d2_dif_et_dydy_0_0_ijm11m2 = d2_dif_et_dydy_0_0_ijm11m2*param_float(2)

d2_dif_et_dydy_0_0_ijp11m2_ijp1m11m2 = ((q(i,j+1-1,indvars(4))-&
                    0.5_wp*(q(i,j+1-1,indvars(2))*q(i,j+1-1,indvars(2))+&
                    q(i,j+1-1,indvars(3))*q(i,j+1-1,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dydy_0_0_ijp11m2_ijp1p11m2 = ((q(i,j+1+1,indvars(4))-&
                    0.5_wp*(q(i,j+1+1,indvars(2))*q(i,j+1+1,indvars(2))+&
                    q(i,j+1+1,indvars(3))*q(i,j+1+1,indvars(3)))))/param_float(4 + 5)

d2_dif_et_dydy_0_0_ijp11m2 = -&
          0.5_wp*d2_dif_et_dydy_0_0_ijp11m2_ijp1m11m2+&
          0.5_wp*d2_dif_et_dydy_0_0_ijp11m2_ijp1p11m2

d2_dif_et_dydy_0_0_ijp11m2 = d2_dif_et_dydy_0_0_ijp11m2*param_float(2)

d1_dif_et_dy_0_ijm11m2 = -param_float(2 + 5)*qst(i,j-1,indvarsst(11))*(d2_dif_et_dydy_0_0_ijm11m2)-&
                    q(i,j-1,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i,j-1,indvarsst(11))*(d2_dif_rhou_dydy_0_0_ijm11m2)+&
                    qst(i,j-1,indvarsst(10))*(d2_dif_rhou_dydx_0_0_ijm11m2)))-&
                    q(i,j-1,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j-1,indvars(4))-&
                    0.5_wp*(q(i,j-1,indvars(2))*q(i,j-1,indvars(2))+&
                    q(i,j-1,indvars(3))*q(i,j-1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i,j-1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijm11m2)-&
                    2.0_wp/3.0_wp*(qst(i,j-1,indvarsst(10))*(d2_dif_rhov_dydx_0_0_ijm11m2)+&
                    qst(i,j-1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijm11m2))))

d1_dif_et_dy_0_ijp11m2 = -param_float(2 + 5)*qst(i,j+1,indvarsst(11))*(d2_dif_et_dydy_0_0_ijp11m2)-&
                    q(i,j+1,indvars(2))*(((1+&
                    param_float(21 + 5))/(((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(qst(i,j+1,indvarsst(11))*(d2_dif_rhou_dydy_0_0_ijp11m2)+&
                    qst(i,j+1,indvarsst(10))*(d2_dif_rhou_dydx_0_0_ijp11m2)))-&
                    q(i,j+1,indvars(3))*(((1+&
                    param_float(21 + 5))/(((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)+&
                    param_float(21 + 5))*((q(i,j+1,indvars(4))-&
                    0.5_wp*(q(i,j+1,indvars(2))*q(i,j+1,indvars(2))+&
                    q(i,j+1,indvars(3))*q(i,j+1,indvars(3)))))/param_float(4 + 5)**1.5)*param_float(1 + 5)*(2.0_wp*qst(i,j+1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijp11m2)-&
                    2.0_wp/3.0_wp*(qst(i,j+1,indvarsst(10))*(d2_dif_rhov_dydx_0_0_ijp11m2)+&
                    qst(i,j+1,indvarsst(11))*(d2_dif_rhov_dydy_0_0_ijp11m2))))

d1_dif_et_dy_0_ij1m2 = -&
          0.5_wp*d1_dif_et_dy_0_ijm11m2+&
          0.5_wp*d1_dif_et_dy_0_ijp11m2

d1_dif_et_dy_0_ij1m2 = d1_dif_et_dy_0_ij1m2*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer None None 0 d(rho et)/dt *******
!                                                           
!***********************************************************


rhs(i,j,indvars(4)) = rhs(i,j,indvars(4))  -  ( qst(i,j,indvarsst(10))*(d1_dif_et_dx_0_ij1m2)+&
                    qst(i,j,indvarsst(11))*(d1_dif_et_dy_0_ij1m2) ) 

     enddo
   enddo

    enddo ! END cache blocking i
  enddo ! END cache blocking j
enddo ! END cache blocking k
!$OMP END DO

 end subroutine boundaryScheme_faces_k1_0


