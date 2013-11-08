<?php global $theme; ?>

    <div id="footer">
    
        <div id="copyrights">
            <?php
                if($theme->display('footer_custom_text')) {
                    $theme->option('footer_custom_text');
                } else { 
                    ?> &copy; <?php echo date('Y'); ?>  <a href="<?php echo home_url(); ?>"><?php bloginfo('name'); ?></a><?php
                }
            ?> 
        </div>
        
        <?php /* 
            All links in the footer should remain intact. 
            These links are all family friendly and will not hurt your site in any way. 
            Warning! Your site may stop working if these links are edited or deleted 
            
            You can buy this theme without footer links online at http://fthemes.com/buy/?theme=hotgames
        */ ?>
        
        <div id="credits">Powered by <a href="http://wordpress.org/"><strong>WordPress</strong></a> | Designed by: <a href="http://www.ir4uk.com">r4</a> | Thanks to <a href="http://www.r4icard.org">r4i card</a>, <a href="http://www.r43dsuk.com">r4 3ds uk</a> and <a href="http://www.r4isdhcuk.com">r4i uk</a></div><!-- #credits -->
        
    </div><!-- #footer -->
    
</div><!-- #container -->

<?php wp_footer(); ?>
<?php $theme->hook('html_after'); ?>
</body>
</html>