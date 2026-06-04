import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DataTableType, LoadingService } from '@kaad/layout/webapp/ui';
import { User } from '@kaad/security/ng-common';
import { UserService } from '@kaad/security/webapp/core';
import { AbstractListComponent } from '@kaad/shared/webapp/ui';

@Component({
    selector: 'kaad-list',
    templateUrl: './list.component.html',
    styleUrls: ['./list.component.scss'],
})
export class ListComponent extends AbstractListComponent<User> {

    override conf: DataTableType<User> = {
        columns: [
            {
                title: 'User',
                field: 'username',
                templateId: 'photo'
            },
            {
                title: 'Role',
                field: 'role',
                templateId: 'role'
            },
            {
                title: 'Status',
                field: 'role',
                templateId: 'status'
            }
        ],
        actions: [
            {
                label: 'Edit',
                iconUrl: '',
                actionIdToReturn: 'edit',
                showOption: () => true
            }
        ]
    }

    constructor(protected override readonly activatedRoute: ActivatedRoute,
                protected override readonly loading: LoadingService,
                protected override readonly router: Router,
                protected readonly userService: UserService) {
            super(activatedRoute, loading, router, userService);
    }

    override ngOnInit() {
        this.search();
    }

    override search = () => {
        import('rxjs').then(({ of }) => {
            this.itemList$ = of([
                { id: '1', username: 'padre.juan@hospitalitos.org', role: { name: 'Administrador' }, status: 'Activo', photoUrl: 'https://i.pravatar.cc/150?u=padre.juan' },
                { id: '2', username: 'hermana.maria@hospitalitos.org', role: { name: 'Editor' }, status: 'Activo', photoUrl: 'https://i.pravatar.cc/150?u=hermana.maria' },
                { id: '3', username: 'coordinador.fe@hospitalitos.org', role: { name: 'Coordinador' }, status: 'Inactivo', photoUrl: 'https://i.pravatar.cc/150?u=coordinador.fe' },
            ]) as any;
        });
    }
}
