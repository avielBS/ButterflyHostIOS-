        //
    //  Report.m
    //  first
    //
    //  Created by Aviel on 9/30/20.
    //  Copyright © 2020 Aviel. All rights reserved.
    //

    #import "Report.h"

    @implementation Report

    - (NSString *) description {
        return [NSString stringWithFormat:@"contact information:%@, comments: %@, fake place:%@, country:%@", self.contactInformation,self.comments,self.fakePlace,self.country];
    }

    @end
