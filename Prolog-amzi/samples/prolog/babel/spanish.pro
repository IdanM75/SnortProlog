% - - - - - - - - - - - - - - -  
 %   S p a n i s h  
 %  
  
 s s e n t e n c e ( M ,   [ ' � ' , C a p F i r s t | R e s t ] ,   [ ] )   : -  
     v a r ( M ) ,  
     c a p i t a l i z e ( F i r s t ,   C a p F i r s t ) ,  
     s s e n t ( M ,   [ ' � ' , F i r s t | R e s t ] ,   [ ] ) .  
 s s e n t e n c e ( M ,   [ C a p F i r s t | R e s t ] ,   [ ] )   : -  
     v a r ( M ) ,  
     c a p i t a l i z e ( F i r s t ,   C a p F i r s t ) ,  
     s s e n t ( M ,   [ F i r s t | R e s t ] ,   [ ] ) .  
 s s e n t e n c e ( M ,   S ,   [ ] )   : -  
     v a r ( S ) ,  
     s s e n t ( M ,   S x ,   [ ] ) ,  
     ( S x   =   [ ' � ' , F i r s t | R e s t ]   - >  
           c a p i t a l i z e ( F i r s t , C a p F i r s t ) ,  
           S   =   [ ' � ' , C a p F i r s t | R e s t ]  
         ;  
           S x   =   [ F i r s t | R e s t ] ,  
           c a p i t a l i z e ( F i r s t , C a p F i r s t ) ,  
           S   =   [ C a p F i r s t | R e s t ] ) .      
  
 s s e n t (   i d e n t i t y ( s u b j ( S ) , o b j ( O ) )   )   - - >  
     s s u b j e c t ( S , G ) ,   s i s v e r b ( _ ) ,   s o b j e c t ( O , G ) ,   s p e r i o d .  
 s s e n t (   i d e n t i t y _ q u e s t i o n ( s u b j ( S ) , o b j ( O ) )   )   - - >  
     s m a r k q u e s t i o n ,   s i s v e r b ( _ ) ,   s s u b j e c t ( S , G ) ,   s o b j e c t ( O , G ) ,   s q u e s t i o n m a r k .  
 s s e n t (   i d e n t i t y _ q u e s t i o n ( s u b j ( S ) , o b j ( O ) )   )   - - >  
     s m a r k q u e s t i o n ,   s p r o n o u n ( O , i n t e r r o g a t i v e ) ,   s i s v e r b ( _ ) ,   s s u b j e c t ( S , _ ) ,   s q u e s t i o n m a r k .  
 s s e n t (   i d e n t i t y ( n o t , s u b j ( S ) , o b j ( O ) )   )   - - >  
     s s u b j e c t ( S , G ) ,   [ n o ] ,   s i s v e r b ( _ ) ,   s s u b j e c t ( O , G ) ,   s p e r i o d .  
 s s e n t (   a t t r i b u t e ( s u b j ( S ) , a t t r ( A ) )   )   - - >  
     s s u b j e c t ( S , G ) ,   s i s v e r b ( _ ) ,   s a d j l i s t ( A , G ) ,   s p e r i o d .  
 s s e n t (   a t t r i b u t e ( n o t , s u b j ( S ) , a t t r ( A ) )   )   - - >  
     s s u b j e c t ( S , G ) ,   [ n o ] ,   s i s v e r b ( _ ) ,   s a d j l i s t ( A , G ) ,   s p e r i o d .  
 s s e n d (   a t t r i b u t e _ q u e s t i o n ( s u b j ( S ) , a t t r ( A ) )   )   - - >  
     s m a r k q u e s t i o n ,   s i s v e r b ( _ ) ,   s s u b j e c t ( S , G ) ,   s a d j l i s t ( A , G ) ,   s q u e s t i o n m a r k .  
  
 s s u b j e c t ( S , G )   - - >   s p r o n o u n ( S , G ) .  
  
 s o b j e c t ( n o u n ( O , [ ] ) , G )   - - >   s a r t i c l e ( _ , G ) ,   s n o u n ( O , G ) .  
 s o b j e c t ( n o u n ( O , [ M O D ] ) , G )   - - >  
     s a r t i c l e ( _ , G ) ,   s n o u n ( O , G ) ,   s a d j ( M O D , G ) .  
  
 s a r t i c l e ( M , G )   - - >   [ X ] ,   {   d i c t ( s d i c t , M , X , [ p s = a r t i c l e , g = G ] )   } .  
  
 s i s v e r b ( M )   - - >   [ X ] ,   {   d i c t ( s d i c t , M , X , [ p s = v e r b , i s ] )   } .  
  
 s p r o n o u n ( M , i n t e r r o g a t i v e )   - - >   [ X ] ,   {   d i c t ( s d i c t , M , X , [ p s = p r o n o u n , i n t e r r o g a t i v e ] )   } .  
 s p r o n o u n ( M , G )   - - >   [ X ] ,   {   d i c t ( s d i c t , M , X , [ p s = p r o n o u n , g = G ] )   } .  
  
 s n o u n ( M , G )   - - >   [ X ] ,   {   d i c t ( s d i c t , M , X , [ p s = n o u n , g = G ] )   } .  
  
 s a d j ( M , G )   - - >   [ X ] ,   {   d i c t ( s d i c t , M , X , [ p s = a d j , g = G ] )   } .  
  
 s p e r i o d   - - >   [ ' .   ' ] .  
 s q u e s t i o n m a r k   - - >   [ ' ? ' ] .  
 s m a r k q u e s t i o n   - - >   [ ' � ' ] .  
  
 s w r i t e _ s e n t e n c e ( [ ' � ' , F i r s t | R e s t ] )   : -  
     ! ,   w r i t e ( ' � ' ) ,   w r i t e ( F i r s t ) ,  
     s w r i t e _ s e n t ( R e s t ) .  
 s w r i t e _ s e n t e n c e ( [ F i r s t | R e s t ] )   : -  
     w r i t e ( F i r s t ) ,  
     s w r i t e _ s e n t ( R e s t ) .  
  
 s w r i t e _ s e n t ( [ ] ) .  
 s w r i t e _ s e n t ( [ ' .   ' ] )   : -  
     w r i t e ( ' .   ' ) ,   ! .  
 s w r i t e _ s e n t ( [ ' ? ' ] )   : -  
     w r i t e ( ' ? ' ) ,   ! .  
 s w r i t e _ s e n t ( [ X | Y ] )   : -  
     w r i t e ( $   $ ) ,   w r i t e ( X ) ,  
     s w r i t e _ s e n t ( Y ) .  
  
 s d i c t ( a ,   u n ,   [ p s = a r t i c l e , g = m a s c ] ) .  
 s d i c t ( a ,   u n a ,   [ p s = a r t i c l e , g = f e m ] ) .  
 s d i c t ( b l a c k ,   n e g r o ,   [ p s = a d j , g = m a s c ] ) .  
 s d i c t ( b l a c k ,   n e g r a ,   [ p s = a d j , g = f e m ] ) .  
 s d i c t ( b o o k ,   l i b r o ,   [ p s = n o u n , g = m a s c ] ) .  
 s d i c t ( b o x ,   c a j a ,   [ p s = n o u n , g = f e m ] ) .  
 s d i c t ( d i c t i o n a r y ,   d i c c i o n a r i o ,   [ p s = n o u n , g = m a s c ] ) .  
 s d i c t ( f a r t h a t ,   e s t e ,   [ p s = p r o n o u n ] ) .  
 s d i c t ( i s ,   e s ,   [ p s = v e r b , i s ] ) .  
 s d i c t ( r e d ,   r o j o ,   [ p s = a d j , g = m a s c ] ) .  
 s d i c t ( r e d ,   r o j a ,   [ p s = a d j , g = f e m ] ) .  
 s d i c t ( w h a t ,   q u e ,   [ p s = p r o n o u n , i n t e r r o g a t i v e ] ) .  
 s d i c t ( p e n c i l ,   l a p i z ,   [ p s = n o u n , g = m a s c ] ) .  
 s d i c t ( t h a t ,   e s e ,   [ p s = a d j , g = m a s c ] ) .  
 s d i c t ( t h a t ,   e s a ,   [ p s = a d j , g = f e m ] ) .  
 s d i c t ( t h a t ,   ' � s e ' ,   [ p s = p r o n o u n , g = m a s c ] ) .  
 s d i c t ( t h a t ,   ' � s a ' ,   [ p s = p r o n o u n , g = f e m ] ) .  
 s d i c t ( t h i s ,   e s t e ,   [ p s = a d j , g = m a s c ] ) .  
 s d i c t ( t h i s ,   e s t a ,   [ p s = a d j , g = f e m ] ) .  
 s d i c t ( t h i s ,   ' � s t e ' ,   [ p s = p r o n o u n , g = m a s c ] ) .  
 s d i c t ( t h i s ,   ' � s t a ' ,   [ p s = p r o n o u n , g = f e m ] ) .  
 